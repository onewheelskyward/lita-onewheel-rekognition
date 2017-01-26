require 'rest-client'
require 'json'

module Lita
  module Handlers
    class OnewheelRekognition < Handler
      config :lambda_uri

      route(/^rekog\s+(.*)/i, :handle_rekog, command: true,
            help: { 'rekog http://image': 'Gets AWS Rekognition data from supplied image.'})

      def handle_rekog(response)
        input = response.matches[0][0]
        Lita.logger.debug "Running rekog on '#{input}'"
        uri = "#{config.lambda_uri}/upload?uri=#{input}"
        Lita.logger.debug "uri: #{uri}"
        upload_response = RestClient.post(uri, {})
        data = JSON.parse(upload_response.body)
        puts data.inspect
        uri = "#{config.lambda_uri}/detect?bucket=#{data['bucket']}&filename=#{data['filename']}"
        detect_response = RestClient.get(uri)
        detected = JSON.parse(detect_response.body)

        str = ''
        detected['Labels'].each_with_index do |label, index|
          str += ', ' if index > 0
          str += "#{label['Name']} #{label['Confidence'].to_f.round(2)}%"
        end

        response.reply str
      end
    end
    Lita.register_handler(OnewheelRekognition)
  end
end
