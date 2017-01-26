require 'rest-client'

module Lita
  module Handlers
    class OnewheelRekognition < Handler

      route(/^rekog\s+(.*)/i, :handle_rekog, command: true,
            help: { 'rekog http://image': 'Gets AWS Rekognition data from supplied image.'})

      def handle_rekog(response)
        input = response.matches[0][0]
        Lita.logger.debug "Running rekog on '#{input}'"


        response.reply get_camera_url(input)
      end
    end
    Lita.register_handler(OnewheelRekognition)
  end
end
