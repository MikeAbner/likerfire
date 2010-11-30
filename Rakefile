require 'spec/rake/spectask'

task :test do
  ENV['RACK_ENV'] = 'test'

  require 'rake/runtest'
  Rake.run_tests 'tests/**/*.rb'
end

Spec::Rake::SpecTask.new('spec') do |t|
  ENV['RACK_ENV'] = 'test'
  t.spec_files = FileList['specs/**/*.rb']
end

namespace :db do
  namespace :migrate do
    namespace :dev do
      task :up do
        ENV['RACK_ENV'] = 'development'
        migrate_up
      end
      task :down do
        ENV['RACK_ENV'] = 'development'
        migrate_down
      end
    end
    namespace :test do
      task :up do
        ENV['RACK_ENV'] = 'test'
        migrate_up
      end
      task :down do
        ENV['RACK_ENV'] = 'test'
        migrate_down
      end
    end
  end
end

def migrate_up
  require 'rubygems'
  require 'active_support'
  require 'active_record'
  
  require 'db/migrations/001_create_users'
  
  CreateUsers.up
end

def migrate_down
  require 'db/migrations/001_create_users'

  CreateUsers.down
end


def setup_connection
  dbconfig = YAML.load(File.read('config/database.yml'))
  print "Establishing connection to #{ENV['RACK_ENV']} database..."
  ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV']]
  puts "done"
end  