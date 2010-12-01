require 'likerfire'
require 'rack/test'

class UserRoutesTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Likerfire.new
  end
  
  def setup
    @auth_hash = JSON.parse '{"user_info":{"name":"Michael Abner","urls":{"Facebook":"http://www.facebook.com/mike.abner","Website":null},"nickname":"mike.abner","last_name":"Abner","first_name":"Michael"},"uid":"527248067","credentials":{"token":"120636147999305|2.KNQotlfzPilJ4mxHQZ5rWA__.3600.1291107600-527248067|B0WlbdVY-eeaYr_3rxqWCq-m78s"},"extra":{"user_hash":{"name":"Michael Abner","location":{"name":"San Francisco, California","id":"114952118516947"},"id":"527248067","gender":"male","timezone":-8,"last_name":"Abner","link":"http://www.facebook.com/mike.abner","locale":"en_US","verified":true,"updated_time":"2010-03-22T21:13:40+0000","first_name":"Michael"}},"provider":"facebook"}'
    @user = User.new @auth_hash
    @user.facebook_api = FacebookApiMock.new
  end
  
  def test_it_returns_a_list_of_likes
    #can't seem to get the session to be populated with the variable needed to run this test
    #get '/users/compare_likes/1', {}, :session => {:current_user => @user}
    
    #assert last_response.status == 200
    #assert last_response.body =~ /<li>water<\/li>/
  end
end