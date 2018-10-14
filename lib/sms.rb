require 'twilio-ruby'

class SMS

  def send(text)

    account_sid = 'AC8eea0c80bd486bd258221ec48de9f775'
    auth_token = '0e15ccc3fbff116f9ce025106655873c'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441133207546' # Your Twilio number
    to = '+447837452334' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: text
    )

  end

end
