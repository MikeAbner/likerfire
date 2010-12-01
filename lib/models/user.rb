class User #< ActiveRecord::Base
  
  attr_accessor :facebook_id, :name, :first_name, :last_name, :nickname, :token
  
  # the facebook_api accessor is so we can write a mock object for testing.  In
  # production this method wouldn't be called, but in testing it's helpful
  # so we don't have to rely on internet connections or on facebook itself
  # to run our tests.
  attr_accessor :facebook_api
  
  def initialize auth_hash
    @facebook_id = auth_hash["uid"]
    @name = auth_hash["user_info"]["name"]
    @first_name = auth_hash["user_info"]["first_name"]
    @last_name = auth_hash["user_info"]["last_name"]
    @nickname = auth_hash["user_info"]["nickname"]
    @token = auth_hash["credentials"]["token"]
    @facebook_api = FacebookApi.new
  end
  
  def friends
    frnds = @facebook_api.friends_for self
    frnds.sort {|x,y| x.name <=> y.name }
  end
  
  def likes
    @facebook_api.likes_for @facebook_id, @token
  end
  
  def compare_likes_with friend_id
    my_likes = likes
    friend_likes = @facebook_api.likes_for friend_id, @token
    
    same_likes = my_likes.select { |like| friend_likes.include? like }
  end
  
end