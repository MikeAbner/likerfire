class Likerfire
  print "Loading User routes..."
  
  # called from the javascript on the welcome page to refresh
  # the results of the comparison of likes.
  get '/users/compare_likes/:friend_id' do |friend_id|
    @user = session['current_user']
    
    @same_likes = @user.compare_likes_with friend_id
    
    haml :results
  end
  
  puts "done"
end