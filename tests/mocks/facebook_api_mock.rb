class FacebookApiMock
  def friends_for user
    a = Friend.new("1", "Loki")
    b = Friend.new("2", "Maia")
    c = Friend.new("3", "Dragon")
    
    [a, b, c]
  end
  
  def likes_for user_id, token
    a = Like.new("1", "chicken", "food")
    b = Like.new("2", "beef", "food")
    c = Like.new("3", "turkey", "food")
    d = Like.new("4", "kibble", "food")
    e = Like.new("5", "water", "drink")
    f = Like.new("6", "milk", "drink")
    
    likes = case user_id
      when "1" then [a, b, e, f]
      when "2" then [a, b, c, d, e, f]
      when "3" then [a, b, c, d, e]
      when "527248067" then [a, b, c, d, e, f]
      else []
    end
  end
  
end