require "#{APP_ROOT}/listeners/posts_persistence"

Wisper.add_listener Listeners::PostsPersistence.new
