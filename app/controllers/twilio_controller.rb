class TwilioController < ApplicationController
  
  def call(number)
    client = Person.set_client
    client.calls.create(
    from: '+1' + ENV['acct_num'],
    to: '+1' + number,
    url: 'https://www.dropbox.com/home?preview=twilio.xml'
    )
  end
  
  def make_call
    contact = Person.least_recent_contact
    call(contact.number) 
    contact.last_attempt = DateTime.now.strftime("%Y-%m-%d")
    contact.save
    return contact.name
  end
end