require 'active_record'
require 'lib/models/user'
require 'lib/models/facebook_api'
require 'json'

class FacebookTest < Test::Unit::TestCase
  def setup
    @auth_hash = JSON.parse '{"user_info":{"name":"Michael Abner","urls":{"Facebook":"http://www.facebook.com/mike.abner","Website":null},"nickname":"mike.abner","last_name":"Abner","first_name":"Michael"},"uid":"527248067","credentials":{"token":"120636147999305|2.KNQotlfzPilJ4mxHQZ5rWA__.3600.1291107600-527248067|B0WlbdVY-eeaYr_3rxqWCq-m78s"},"extra":{"user_hash":{"name":"Michael Abner","location":{"name":"San Francisco, California","id":"114952118516947"},"id":"527248067","gender":"male","timezone":-8,"last_name":"Abner","link":"http://www.facebook.com/mike.abner","locale":"en_US","verified":true,"updated_time":"2010-03-22T21:13:40+0000","first_name":"Michael"}},"provider":"facebook"}'
    #@user = User.create_or_update_with @auth_hash
    
  end
  def test_it_should_find_the_list_of_friends_for_an_existing_user
    
  end
end