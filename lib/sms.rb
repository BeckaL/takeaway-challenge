require_relative 'text_body'
require 'twilio-ruby'
# Dotenv.require_keys("TWILIO_ACCOUNT_SID", "MY_PHONE")

class SMS

  def initialize(text_body = TextBody)
    @text_body = text_body.new
  end

  def send(food, price)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['MY_TWILIO_NUM']
    to = ENV['MY_PHONE']

    client.messages.create(
    from: from,
    to: to,
    body: @text_body.format_text(food, price)
    )

  end

end

p ENV['MY_TWILIO_NUM']
my_sms = SMS.new
