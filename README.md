  [![Build Status](https://travis-ci.org/zamith/yaba-core.png)](https://travis-ci.org/zamith/yaba-core)
================

YABA (Yet Another Blog Application) written from scratch, and following an
hexagonal arch approach.

It has entities which are the core of the app, repositories which work as
adapters for the database, value object that represent the actual data of the
system and are what is passed around, it will also have use cases (or interactors)
and a delivery mechanism.

Running
=======

YABA can be run with different delivery mechanisms, which are in different repos:

* Rails

        bundle exec rake db:migrate
        bundle exec rails server

* CLI

        bundle exec ruby blog.rb get post 1

Configuring
===========

Load the core from your Gemfile:

    gem 'yaba-core', github: 'zamith/yaba-core', require: false

and then require it:

    require 'yaba/core'

You can then configure it:

    Yaba::Core::Config.configure do |config|
      config.repository = :active_record
    end

In the rails app, I would recommend adding this to the end of your `application.rb`
