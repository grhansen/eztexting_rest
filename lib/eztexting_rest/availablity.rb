module EztextingRest
  class Availability < Base
    
    # Check the availablity of a keyword 
    # keyword - this would be the key your checking
    #  
    # Examples
    #   EztextingRest::Availability.check("games")
    #   => [200, "Success - The Keyword is available", "<?xml version=\"1.0\" e......]
    # returns back the status code, the intepreted string and the raw response
    def self.check(keyword)
      location   = "/keywords/new"
      parameters = {"Keyword" => keyword}
      get(location,parameters)
    end
    
    def self.response_code_to_string(code)
      case code
      when 200 then "Success - The Keyword is available"
      when 201 then "Success - A new message has been scheduled for delivery"
      when 401 then "Unauthorized - Authentication credentials are missing or incorrect"
      when 403 then "Forbidden - Request is not valid. An accompanying error message explains why. Keyword Unavailable"
      when 500 then "Internal Server Error - Something is broken. Please create a support ticket."
      end
    end
    
  end
end