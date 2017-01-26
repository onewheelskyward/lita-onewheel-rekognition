require 'spec_helper'

describe Lita::Handlers::OnewheelRekognition, lita_handler: true do
  before(:each) do
  end

  it { is_expected.to route_command('rekog http://image') }

  it 'will respond to rekog' do
    send_command 'rekog http://image'
    expect(replies.last).to include('Image 100%')
  end
end
