$:.unshift(File.dirname(__FILE__) + "../lib")

require 'test/unit'
require 'rubygems'
require 'webmock/test_unit'
require 'eztexting_rest'

class EztextingRestTest < ActiveSupport::TestCase
  
  def setup
    # Stub All outbound requests to make sure tests do not hit api
    stub_request(:any, /.*app.eztexting.com.*/)
    
    @username = "Customer"
    @password = "Secret"
    EztextingRest.connect!(@username,@password)
  end
  
  test 'EztextingRest#credentials should store when connect! is run' do
    assert_equal EztextingRest.credentials, {'User' => @username, 'Password' => @password}
  end
  
  test 'EztextingRest#base_uri should return as app.eztexting.com' do
    assert_equal EztextingRest.base_uri, "https://app.eztexting.com"
  end
  
  test 'EztextingRest::Lookup# should call sending/phone-number/ with the phone number as part of the uri ' do
    EztextingRest::Lookup.carrier("5551230987")
    assert_requested :get, "https://app.eztexting.com/sending/phone-numbers/5551230987?Password=Secret&User=Customer&format=xml"
  end
    
  test 'EztextingRest::Credits#balance should make get request to billing/credits/get' do
    EztextingRest::Credits.balance
    assert_requested :get, "https://app.eztexting.com/billing/credits/get?Password=Secret&User=Customer&format=xml"
  end
  
  test 'EztextingRest::Credits#purchase should post to billing/credits' do
    opts = {
      :credits => 1, :coupon_code => "code", :first_name => "david", :last_name => "marks", 
      :address => "101 East 1st Ave", :city => "NY", :state => "NY",
      :zip => '10015', :country => "USA", :card_type => "VISA", :number => '41473123123312', 
      :security_code => "121", :expiration_month => "11", :expiration_year => "2011" 
    }
    EztextingRest::Credits.purchase(opts)
    assert_requested :post, "https://app.eztexting.com/billing/credits"
  end
  
  test 'EztextingRest::Keyword#check should post to keywords/new' do
    EztextingRest::Keywords.check("candy")
    assert_requested :get, "https://app.eztexting.com/keywords/new?Keyword=candy&Password=Secret&User=Customer&format=xml"
  end
  
  test 'EztextingRest::Keyword#rent should post to /keywords' do
    opts = {
      :keyword => "Testing Coverage", :first_name => "david", :last_name => "marks", 
      :address => "101 East 1st Ave", :city => "NY", :state => "NY",
      :zip => '10015', :country => "USA", :card_type => "VISA", :number => '41473123123312', 
      :security_code => "121", :expiration_month => "11", :expiration_year => "2011" 
    }
    EztextingRest::Keywords.rent(opts)
    assert_requested :post, "https://app.eztexting.com/keywords"
  end
  
  test 'EztextingRest::Keyword#configure should post to /keywords/<keyword>' do
    options = {
      :keyword => "foobar" , :enable_double_optin => "Y", :confirm_message => "configured", :join_message => "msg", 
      :forward_email => "none@none.com", :foward_url => "http://www.google.com", :contact_group_ids => "3"
    }
    
    EztextingRest::Keywords.configure(options)
    assert_requested :post, "https://app.eztexting.com/keywords/foobar"
  end
  
  test 'EztextingRest::Keyword#cancel should post to /keywords/<keyword>' do
    EztextingRest::Keywords.cancel("unused")
    assert_requested :post, "https://app.eztexting.com/keywords/unused"
  end
  
  test 'EztextingRest::Sms#single should post to /sending/messages' do
    opts = { 'PhoneNumbers[]'=>'5551239988', 'Subject'=>'Check it out', 'Message'=>'I am making an awesome application with this api!'}
    EztextingRest::Sms.single(opts)
    assert_requested :post, "https://app.eztexting.com/sending/messages"
  end
  
  test 'EztextingRest::Sms#multi should post to /sending/messages TWICE' do
    opts = [
      { 'PhoneNumbers[]'=>'5551239988', 'Subject'=>'Check it out', 'Message'=>'I am making an awesome application with this api!'},
      { 'PhoneNumbers[]'=>'5551239988', 'Subject'=>'Check it out, AGAIN', 'Message'=>'I am making an awesome application with this api!'}
    ]
    EztextingRest::Sms.multi(opts)
    assert_requested :post, "https://app.eztexting.com/sending/messages", :times => 2
  end
  
  test 'EztextingRest::Voice#broadcaset should post to /voicemessages' do
    opts = {:numbers => "3213213124", :soundfile => "location_of_file", :srecording => "src", :caller_id => '21232121212'}
    EztextingRest::Voice.broadcast(opts)
    assert_requested :post, "https://app.eztexting.com/voicemessages/"
  end
end