# README

To run the rails app do:

    bundle exec rake db:migrate
    bundle exec rails server

# Configuring

In order for this app to work the Gemfile has to load the master's Gemfile into
a group called `master`, like so:

    group :master do
      file = 'path/to/master/Gemfile'
      if File.exists?(file)
        eval File.read(file), binding
      end
    end

It must also load the master's configs and may customize it a bit:


    require_relative 'path/to/master/config'
    Core.configure do |config|
      config.repository = :active_record
    end

I would recommend adding this to the end of your `application.rb`
