class User < ActiveRecord::Base
  
  def self.create_or_update_with auth_hash
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
  
end