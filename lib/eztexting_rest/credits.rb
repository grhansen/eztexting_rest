module EztextingRest
  class Credits < Base
    
    # Check the balance of credits left on your account
    # Examples:
    #   EztextingRest::Credits.balance
    #   =>
    # Returns the count of credits that your account has left
    def self.balance
      location = "/billing/credits/get"
      
      return get(location,{})
    end
    
    # Purchase more credits for your account
    # opts - This is a hash of all your billing information and the credits that you want
    # Examples:
    #   EztextingRest::Credits.purchase
    #   =>
    def self.purchase(opts={})
      location = "/billing/credits"
      options = {
        'credits'   => opts[:credits],
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
    
    private

  end
end