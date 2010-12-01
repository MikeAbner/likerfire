require 'rest-graph'

class FacebookApi
  
  # Retrieve the list of friends for a given user.
  # Returns an Array of Friend objects
  def friends_for user
    rg = RestGraph.new(:access_token => user.token)
    #rest-graph.get returns an array of hashes containing the data
    raw_friends = rg.get("#{user.facebook_id}/friends")
    friends = raw_friends["data"].map{ |f| Friend.new(f['id'], f['name']) }
  end
  
  # Retrieve the list of likes for a given user_id.
  # returns an Array of Like objects
  def likes_for user_id, token
    rg = RestGraph.new(:access_token => token)
    likes = parse_likes(rg.get("#{user_id}/likes"))
  end

  private
  
  def parse_likes(raw_likes)
    likes = raw_likes["data"].map{ |l| Like.new(l['id'], l['name'], l['category']) }
  end
end