source 'https://rubygems.org'
source 'https://rails-assets.org'

group :master do
  file = '../../Gemfile'
  if File.exists?(file)
    eval File.read(file), binding
  end
end

gem 'bitters'
gem 'bourbon'
gem 'bson_ext'
gem 'coffee-rails', '~> 4.0.0'
gem 'draper'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'mongoid', '~> 4', github: 'mongoid/mongoid', require: false
gem 'rails', '~> 4.0.1'
gem 'rails-assets-normalize-css'
gem 'sass-rails', '~> 4.0.0'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'pry'
  gem 'quiet_assets'
  gem 'sqlite3'
end

group :doc do
  gem 'sdoc', require: false
end
