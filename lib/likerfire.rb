class Likerfire < Sinatra::Base
  
  # require all of the files needed for the app.  In a larger app the
  # array of directories would include things like helpers, controllers, and
  # mailers.  In a larger app this would prevent you from having a huge list
  # of require statements at the top of the app.
  ["models"].each do |dir|
    files = Dir["lib/#{dir}/*.rb"]
    print "Requiring all files in #{dir}..."
    files.each do |file|
      require file
    end
    puts "done"
  end
  
  # load each of the route definitions into the app.  Using require for these
  # files won't work according to the sinatra documentation.
  load 'lib/routes/root_routes.rb'
  load 'lib/routes/authentication_routes.rb'
  load 'lib/routes/user_routes.rb'

end