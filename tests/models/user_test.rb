require 'active_record'
require 'lib/models/user'
require 'json'

class UserTest < Test::Unit::TestCase
  def setup
    @auth_hash = JSON.parse '{"user_info":{"name":"Michael Abner","urls":{"Facebook":"http://www.facebook.com/mike.abner","Website":null},"nickname":"mike.abner","last_name":"Abner","first_name":"Michael"},"uid":"527248067","credentials":{"token":"120636147999305|2.KNQotlfzPilJ4mxHQZ5rWA__.3600.1291107600-527248067|B0WlbdVY-eeaYr_3rxqWCq-m78s"},"extra":{"user_hash":{"name":"Michael Abner","location":{"name":"San Francisco, California","id":"114952118516947"},"id":"527248067","gender":"male","timezone":-8,"last_name":"Abner","link":"http://www.facebook.com/mike.abner","locale":"en_US","verified":true,"updated_time":"2010-03-22T21:13:40+0000","first_name":"Michael"}},"provider":"facebook"}'
    @existing_user = User.create(:facebook_id => "527248067", :name => "Mike Abner", :first_name => "Mike", :last_name => "Abner", :nickname => "Mikey")
  end
  def test_it_should_create_a_new_user_when_none_exists
    u = User.new

    user = User.create_or_update_from @auth_hash
    
    u = User.first
    assert u
    assert u.name == "Michael Abner"
    assert u.first_name == "Michael"
    assert u.last_name == "Abner"
    assert u.nickname == "mike.abner"
    assert u.token != ""
  end
  def test_it_should_update_an_existing_user
    assert @existing_user.name == "Mike Abner"
    assert @existing_user.first_name == "Mike"
    assert @existing_user.nickname == "Mikey"
    
    user = User.create_or_update_from @auth_hash
    
    assert user.name == "Michael Abner"
    assert user.first_name == "Michael"
    assert user.nickname == "mike.abner"
  end
end