module EztextingRest
  class Voice < Base
    
    # Use the Voicebroadcast feature of the API
    def self.broadcast(opts={})
      location = "/voicemessages/"
      
      options = {
        'phonenumbers' => phone_numbers,
        'soundsource' => opts[:recording],
        'callerid' => opts[:called_id]
      }
      
      processed_response = post(location,options)
    end
    
  end
end