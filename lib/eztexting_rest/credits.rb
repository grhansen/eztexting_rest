module EztextingRest
  class Credits < Base
    
    # Check the balance of credits left on your account
    # Examples:
    #   EztextingRest::Credits.balance
    #   =>
    # Returns the count of credits that your account has left
    def self.balance
      location = "/billing/credits/get"
      
      processed_response = get(location,{})
    end
    
    
    # Purchase more credits for your account
    # opts - This is a hash of all your billing information and the credits that you want
    # Examples:
    #   EztextingRest::Credits.purchase
    #   =>
    def self.purchase(opts={})
      location = "/billing/credits"
      options = {
        'NumberOfCredits'  => opts[:credits],
        'CouponCode'       => opts[:coupon_code],
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
        'ExpirationYear'   => => opts[:expiration_year]
      }
      
      processed_response = post(location,options)
    end
    
  end
end