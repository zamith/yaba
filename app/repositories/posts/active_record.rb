require 'active_record'
require "#{APP_ROOT}/serializers/pipeline"

module Repositories
  module Posts
    class ActiveRecord
      def save(post)
        post = Post.create(post.value)
        post.id + 1
      end

      def all
        Post.all
      end

      def find_by_id(post_id)
        Post.find(post_id)
      end

      def first
        Post.first
      end

      def clear
        Post.all.map(:destroy)
      end
    end

    class Post < ::ActiveRecord::Base
      def value(serializer: Serializers::Pipeline)
        serializer.new(self).serialize(attrs_method: :attributes)
      end
    end
  end
end
