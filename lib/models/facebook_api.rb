require 'rest-graph'

class FacebookApi
  
  def self.friends_for user
    rg = RestGraph.new(:access_token => user.token)
    
    raw_friends = rg.get("#{user.facebook_id}/friends")
    
    friends = raw_friends["data"].map{ |f| Friend.new(f['id'], f['name']) }
  end
  
  def self.likes_for user
    rg = RestGraph.new(:access_token => user.token)
    raw_likes = rg.get("#{user.facebook_id}/likes")
    likes = raw_likes["data"].map{|l| Like.new(l['id'], l['name'], l['category'])}
  end
  
  def self.likes_for_friend user, friend_id
    rg = RestGraph.new(:access_token => user.token)
    raw_likes = rg.get("#{friend_id}/likes")
    likes = raw_likes["data"].map{|l| Like.new(l['id'], l['name'], l['category'])}
  end

end