class TwilioController < ApplicationController
  
  def call(number)
    client = Person.set_client
    client.calls.create(
    from: '+1' + acct_num,
    to: '+1' + number,
    url: 'twilio.xml'
    )
  end
  
  def make_call
    contact = Person.least_recent_contact
    call(contact.number) 
    contact.last_attempt = DateTime.now.strftime("%Y-%m-%d")
    contact.save
  end
end