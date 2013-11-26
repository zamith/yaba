require "#{APP_ROOT}/services/saves_posts"

Wisper.add_listener Services::SavesPosts.new
