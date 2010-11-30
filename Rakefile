require 'spec/rake/spectask'

task :test do
  require 'rake/runtest'
  
  Rake.run_tests 'tests/**/*.rb'
end

Spec::Rake::SpecTask.new('spec') do |t|
  ENV['RACK_ENV'] = 'test'
  t.spec_files = FileList['specs/**/*.rb']
end