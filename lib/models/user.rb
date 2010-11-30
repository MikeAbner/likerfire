class User < ActiveRecord::Base
  
  def self.create_or_update_from auth_hash
    id = auth_hash["uid"]
    name = auth_hash["user_info"]["name"]
    f_name = auth_hash["user_info"]["first_name"]
    l_name = auth_hash["user_info"]["last_name"]
    nickname = auth_hash["user_info"]["nickname"]
    token = auth_hash["credentials"]["token"]
    
    user = User.where(:facebook_id => id).first
    
    if user.nil?
      user = User.new
      user.facebook_id = id
    end

    user.name = name
    user.first_name = f_name
    user.last_name = l_name
    user.nickname = nickname
    user.token = token

    user.save
    
    user
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