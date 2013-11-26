yaba  [![Build Status](https://travis-ci.org/zamith/yaba.png)](https://travis-ci.org/zamith/yaba)
================

YABA (Yet Another Blog Application) written from scratch, and following an
hexagonal arch approach.

It has entities which are the core of the app, repositories which work as
adapters for the database, value object that represent the actual data of the
system and are what is passed around, it will also have use cases (or services)
and a delivery mechanism.

Running
=======

YABA can be run with different delivery mechanisms:

* Rails

        cd delivery_mechanisms/rails_app
        bundle exec rake db:migrate
        bundle exec rails server

Configuring
===========

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

In the rails app, I would recommend adding this to the end of your `application.rb`
