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
        bundle exec rails server
