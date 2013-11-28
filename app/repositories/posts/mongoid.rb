require 'mongoid'

module Repositories
  module Posts
    class Mongoid
      class Post < ::ActiveRecord::Base
        def value(serializer: Serializers::Pipeline)
          serializer.new(self).serialize(attrs_method: :attributes)
        end
      end
    end
  end
end
