class TwilioController < ApplicationController
  
  def call(number)
    client = Person.set_client
    client.calls.create(
    from: '+1' + ENV['acct_num'],
    to: '+1' + number,
    url: 'http://cl.ly/code/0f0c1s0h1F1W?_ga=1.59697326.2046014571.1436368265'
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