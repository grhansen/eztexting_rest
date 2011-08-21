module EztextingRest
  class Lookup < Base
    
    # Lookup the carrier for a telephone mobile number
    def self.carrier(phone_number)
      location = "/sending/phone-numbers/phone-number"
      options  = {'phonenumber' => phone_number}  
      
      return get(location,options)
    end
    
  end
end