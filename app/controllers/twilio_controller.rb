require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. You\'ve reached Ka Mok\'s website\'s toy using the Twilio API.', :voice => 'alice'
        # r.Play 'http://linode.rabasa.com/cantina.mp3'
        r.Play 'http://picosong.com/Z3qZ/'
    end

    render_twiml(response)
  end

  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '347-933-6917', to: '718-207-7558', body: 'Hey Ka, from Ka.'
    render plain: message.status
  end

  def send_joke
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '347-933-6917', to:  params[:phone_number], body: 'Can a kangaroo jump higher than a house? Of course, a house doesn’t jump at all.'
    render plain: message.status
  end

end