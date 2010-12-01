class User #< ActiveRecord::Base
  
  attr_accessor :facebook_id, :name, :first_name, :last_name, :nickname, :token
  
  def initialize auth_hash
    @facebook_id = auth_hash["uid"]
    @name = auth_hash["user_info"]["name"]
    @first_name = auth_hash["user_info"]["first_name"]
    @last_name = auth_hash["user_info"]["last_name"]
    @nickname = auth_hash["user_info"]["nickname"]
    @token = auth_hash["credentials"]["token"]
  end
  
  def friends
    frnds = FacebookApi.friends_for self
    frnds.sort {|x,y| x.name <=> y.name }
  end
  
  def likes
    FacebookApi.likes_for self
  end
  
  def compare_likes_with friend_id
    my_likes = likes
    friend_likes = FacebookApi.likes_for_friend self, friend_id
    
    same_likes = my_likes.select do |like|
      friend_likes.include? like
    end
  end
  
end