require "#{APP_ROOT}/persistence/posts"
require 'wisper'

Wisper.add_listener Persistence::Posts.new
