require "rake"
require 'rake/testtask'
require "bundler/gem_tasks"

Dir["lib/tasks/*.rake"].each { |rake| load rake }

Rake::TestTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  # spec.rspec_opts = ['--backtrace']
end

if ENV['TRAVIS'] && ENV['QUALITY'] == 'false'
  task :default => 'spec'
elsif RUBY_VERSION > '1.9' && defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby'
  task :default => 'spec:cane'
else
  task :default => 'spec'
end
