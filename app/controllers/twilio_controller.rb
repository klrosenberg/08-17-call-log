class TwilioController < ApplicationController
  
  def call(number)
    client = Person.set_client
    client.calls.create(
    from: '+1' + ENV['acct_num'],
    to: '+1' + number,
    url: 'http://f.cl.ly/items/3z3W2A3c2R0y0q0W2u2C/twilio.xml'
    )
  end
  
  def make_call
    contact = Person.least_recent_contact
    call(contact.number) 
    contact.last_attempt = DateTime.now.strftime("%Y-%m-%d")
    contact.save
    render :text => contact.name
  end
end