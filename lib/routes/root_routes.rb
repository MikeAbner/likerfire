class Likerfire
  print "Loading Root routes..."
  
  get '/' do
    haml :index
  end
  
  puts "done"
end