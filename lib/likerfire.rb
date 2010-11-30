class Likerfire < Sinatra::Base
  
  ["models"].each do |dir|
    files = Dir["lib/#{dir}/*.rb"]
    print "Requiring all files in #{dir}..."
    files.each do |file|
      require file
    end
    puts "done"
  end
  
  dbconfig = YAML.load(File.read('config/database.yml'))
  print "Establishing connection to #{ENV['RACK_ENV']} database..."
  ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV']]
  puts "done"
  
  load 'lib/routes/root_routes.rb'
  load 'lib/routes/authentication_routes.rb'
  load 'lib/routes/user_routes.rb'

end