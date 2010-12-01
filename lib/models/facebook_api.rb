require 'rest-graph'

class FacebookApi
  
  def friends_for user
    rg = RestGraph.new(:access_token => user.token)
    raw_friends = rg.get("#{user.facebook_id}/friends")
    friends = raw_friends["data"].map{ |f| Friend.new(f['id'], f['name']) }
  end
  
  def likes_for user_id, token
    rg = RestGraph.new(:access_token => token)
    likes = parse_likes(rg.get("#{user_id}/likes"))
  end

  private
  
  def parse_likes(raw_likes)
    likes = raw_likes["data"].map{|l| Like.new(l['id'], l['name'], l['category'])}
  end
end