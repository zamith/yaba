source 'https://rubygems.org'

group :master do
  file = '../../Gemfile'
  if File.exists?(file)
    eval File.read(file), binding
  end
end

gem 'activerecord', require: false
gem 'sqlite3', require: false
gem 'commander'
gem 'mongoid', '~> 4', github: 'mongoid/mongoid', require: false

