require 'active_record'
require "#{APP_ROOT}/serializers/pipeline"

module Repositories
  module Posts
    class ActiveRecord
      def save(post)
        post_value = post.value
        post_value.delete :id
        post = Post.create(post_value)
        post.id + 1
      end

      def update(post)
        old_post = Post.find(post.id)
        old_post.update post.value
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
