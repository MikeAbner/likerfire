class Likerfire
  print "Loading Root routes..."
  
  get '/' do
    haml :index
  end
  
  get '/welcome' do
    @user = session["current_user"]
    
    @friends = @user.friends
    
    haml :welcome
  end
  
  get '/results' do
    
    haml :results
  end
  
  puts "done"
end