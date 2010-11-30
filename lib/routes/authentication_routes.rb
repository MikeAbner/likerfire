class Likerfire
  print "Loading Authentication routes..."
  
  get '/auth/facebook/callback' do
    @auth_hash = request.env['omniauth.auth']
    
    pp @auth_hash
  end
  
  puts "done"
end