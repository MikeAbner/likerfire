class Likerfire
  print "Loading Authentication routes..."
  
  get '/auth/facebook/callback' do
    @auth_hash = request.env['omniauth.auth']
    
    User.create_or_update_with @auth_hash
  end
  
  puts "done"
end