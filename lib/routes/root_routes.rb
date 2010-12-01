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
  
  puts "done"
end