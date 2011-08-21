module EztextingRest
  class Sms < Base
    
    # Send out a singular SMS
    # opts - hash with keys/value pairs of subject, message and phone number. The phonenumber, subject and message are required by the API
    #
    # Examples:
    #   EztextingRest::Sms.single( {'PhoneNumbers[0]'=>'5555555556','Subject'=>'My Subject',  'Message'=>'My Message'})
    #   => [201, "Success - A new message has been scheduled for delivery", "<?xm.....]
    # Returns status, processed status response and the raw body
    def self.single(opts={})
      location = "/sending/messages"
      
      return post(location,opts)
    end
    
    # Send Out Multiple Messages
    # messages - an array of parameters like the entire hash provided for the call above
    #
    # Examples:
    #   EztextingRest::Sms.Multi( [{'PhoneNumbers[0]'=>'5555555556','Subject'=>'My Subject',  'Message'=>'My Message'}, 
    #                             {'PhoneNumbers[0]'=>'5555555556','Subject'=>'My Subject',  'Message'=>'My Message'}])
    #   => [1, 201, "Success - A new message has been scheduled for delivery", "<?xm....., 
    #       2, 201, "Success - A new message has been scheduled for delivery", "<?xm.....]
    # Returns an array of the status's of each outbound sms
    def self.multi(messages)
      location = "/sending/messages"
      results = []
        
      messages.each_with_index do |msg, i|
        opts = msg
        response = post(location,opts)
        results << {:message => i+1, :result => response}
      end
      
      return results
    end
    

    
  end
end