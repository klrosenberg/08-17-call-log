class Person < ActiveRecord::Base
  
  def self.set_client
    Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
  end
  
  def self.list
    Person.all.order('last_call ASC')
  end
  
  def self.least_recent_contact
    Person.where.not(last_attempt: '2015-08-17').order("last_call ASC").first
  end
end
