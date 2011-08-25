module EztextingRest
  class Voice < Base
    
    # Use the Voicebroadcast feature of the API
    def self.broadcast(opts={})
      location = "/voicemessages/"
      
      options = {
        'phonenumbers' => opts[:numbers],
        'soundsource'  => opts[:recording],
        'callerid'     => opts[:caller_id],
        'soundfile'    => opts[:soundfile]
      }
      puts options.inspect
      processed_response = post(location,options)
    end
    
  end
end