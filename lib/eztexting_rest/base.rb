module EztextingRest
  class Base
    
    class << self
      def post(uri,options)
        url      = EztextingRest.base_uri + uri
        params   = post_request_options(options)
        response = Curl::Easy.http_post(url, *params)
      
        return process(response.body_str)
      end
    
      def get(uri,parameters)
        parameters = get_request_options(parameters)
        url        = EztextingRest.base_uri + uri + "?" + parameters
        response   = Curl::Easy.perform(url)
      
        return process(response.body_str)
      end
      
      def delete(uri,options)
        options    = options.merge!('_method' => 'DELETE')
        parameters = post_request_options(options)
        url        = EztextingRest.base_uri + uri + "?" + parameters
        response   = Curl::Easy.perform(url)
      
        return process(response.body_str)
      end
      
      private
    
    
      # Return format defaults to xml
      def post_request_options(options)
        fields = []
        options.merge!(EztextingRest.credentials)
        options.merge!({"format" => 'xml'})
        options.each_pair do |field,value|
          fields << Curl::PostField.content(field,value)
        end
      
        fields
      end
    
      def get_request_options(options)
        options.merge!(EztextingRest.credentials)
        options.merge!({"format" => 'xml'})
        options = options.to_a.map! { |p| p.first + "=" + p.last }.join("&")
        options
      end

      def process(response)
        doc    = Nokogiri::XML(response)      
        status = doc.xpath("//Status").text
        code   = doc.xpath("//Code").text.to_i

        return [code,response_code_to_string(code),response]
      end
    
      def response_code_to_string(code)
        case code
        when 201 then "Success - A new message has been scheduled for delivery"
        when 401 then "Unauthorized - Authentication credentials are missing or incorrect"
        when 403 then "Forbidden - Request is not valid. An accompanying error message explains why."
        when 500 then "Internal Server Error - Something is broken. Please create a support ticket."
        end
      end
      
      
    end
  end
end