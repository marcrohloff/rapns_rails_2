source 'https://rubygems.org'

gem 'rake'
gem 'rails', '~>2.3'

gem 'database_cleaner', '1.0.1'
gem 'timecop', '0.5.9.2'

group :test, :development do
  # gem 'simplecov'
  gem 'rspec-rails', '1.3.4'
end

#platform :mri_19, :mri_20 do
#  gem 'cane'
#end

platform :ruby do
  gem 'pg'
  gem 'mysql2'
  gem 'yajl-ruby'
  gem 'sqlite3'
end

platform :jruby do
  gem 'activerecord-jdbc-adapter', '>= 1.2.6'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbch2-adapter'
  gem 'jdbc-postgres'
  gem 'jruby-openssl'
end

gemspec
