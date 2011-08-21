module EztextingRest
  class Keywords < Base

    # Rent a keyword
    # opts - This take a hash of the keyword to be purchased and the credit card purchasing information
    def self.rent(opts={})
      location = "/keywords"
      options  = {
        'keyword'   => opts[:keyword],
        'firstname' => opts[:first_name],
        'lastname'  => opts[:last_name],
        'address'   => opts[:address], 
        'city'      => opts[:city], 
        'state'     => opts[:state], 
        'zip'       => opts[:zip], 
        'country'   => opts[:country], 
        'type'      => opts[:cc_type], 
        'ccnumber'  => opts[:cc_number],
        'cccode'    => opts[:cc_verification_code], 
        'expm'      => opts[:cc_expiration_month], 
        'expy'      => opts[:cc_expiration_year]
      }
      
      return post(location,options)
    end
    
    # Configure A Keyword
    # opts - This is a hash of options to configure the keywords
    def self.configure
      location = "/keyword/keyword"
      options = {
        'Keyword'           => opts[:keyword],
        'EnableDoubleOptIn' => opts[:enable_double_optin],
        'ConfirmMessage'    => opts[:confirm_message],
        'JoinMessage'       => opts[:join_message],
        'ForwardEmail'      => opts[:forward_email],
        'ForwardUrl'        => opts[:foward_url],
        'ContactGroupIDs'   => opts[:contact_group_ids]
      }
      
      return post(location,options)      
    end
    
    # Cancel A Keyword
    # opts - The keyword in question to be deleted
    def self.cancel
      location   = "/keywords/keyord"
      parameters = {"Keyword" => keyword}
      
      return delete(location,parameters)     
    end
    
  end
end