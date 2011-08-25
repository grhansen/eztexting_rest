module EztextingRest
  class Keywords < Base
    
    
    # Check the availablity of a keyword 
    # keyword - this would be the key your checking
    #  
    # Examples
    #   EztextingRest::Keyword.check("games")
    #   => [200, "Success - The Keyword is available", "<?xml version=\"1.0\" e......]
    # returns back the status code, the intepreted string and the raw response
    def self.check(keyword)
      location   = "/keywords/new"
      parameters = {"Keyword" => keyword}
      
      processed_response = get(location,parameters)
    end
    
    
    # Rent a keyword
    # opts - This take a hash of the keyword to be purchased and the credit card purchasing information
    def self.rent(opts={})
      location = "/keywords"
      options  = {
        'Keyword'          => opts[:keyword],
        'FirstName'        => opts[:first_name],
        'LastName'         => opts[:last_name],
        'Street'           => opts[:address], 
        'City'             => opts[:city], 
        'State'            => opts[:state], 
        'ZIP'              => opts[:zip], 
        'Country'          => opts[:country], 
        'CreditCardTypeID' => opts[:card_type],
        'Number'           => opts[:number], 
        'SecurityCode'     => opts[:security_code], 
        'ExpirationMonth'  => opts[:expiration_month],
        'ExpirationYear'   => opts[:expiration_year]
      }
      
      processed_response = post(location,options)
    end
    
    # Configure A Keyword
    # opts - This is a hash of options to configure the keywords
    def self.configure
      location = "/keywords/#{opts[:keyword]}"
      options = {
        'Keyword'           => opts[:keyword],
        'EnableDoubleOptIn' => opts[:enable_double_optin],
        'ConfirmMessage'    => opts[:confirm_message],
        'JoinMessage'       => opts[:join_message],
        'ForwardEmail'      => opts[:forward_email],
        'ForwardUrl'        => opts[:foward_url],
        'ContactGroupIDs'   => opts[:contact_group_ids]
      }
      
      processed_response = post(location,options)      
    end
    
    # Cancel A Keyword
    # opts - The keyword in question to be deleted
    def self.cancel(keyword)
      location   = "/keywords/#{keyword}"
      
      processed_response = delete(location,{})     
    end
    
  end
end