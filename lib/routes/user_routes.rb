class Likerfire
  print "Loading User routes..."
  
  get '/users/compare_likes/:friend_id' do |friend_id|
    @user = session['current_user']
    
    @same_likes = @user.compare_likes_with friend_id
    
    haml :results
  end
  
  puts "done"
end