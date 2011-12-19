require 'net/https'
require 'uri'
require 'curb'
require 'nokogiri'
require 'active_support'
require 'eztexting_rest/base'
require 'eztexting_rest/keywords'
require 'eztexting_rest/sms'
require 'eztexting_rest/credits'
require 'eztexting_rest/keywords'
require 'eztexting_rest/lookup'
require 'eztexting_rest/voice'

module EztextingRest
  
  # Sets up the connection that the other classes
  # use to be able communicate with the api
  def self.connect!(username,password)
    @username = username
    @password = password 
    puts "credentials cached"
  end
  
  def self.credentials
    {'User' => @username, 'Password' => @password}
  end
  
  def self.base_uri
    "https://app.eztexting.com"
  end
  
end
