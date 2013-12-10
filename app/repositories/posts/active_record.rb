require 'active_record'
require "#{APP_ROOT}/serializers/pipeline"
require "#{APP_ROOT}/entities/post"

module Repositories
  module Posts
    class ActiveRecord
      def save(post)
        post_value = post.value
        post_value.delete :id
        Entities::Post.new Post.create(post_value).value
      end

      def update(post)
        old_post = Post.find(post.id)
        old_post.update post.value
      end

      def delete(post_id)
        existing_post = Post.find(post_id)
        existing_post.destroy
      end

      def all
        Post.all.map do |post|
          Entities::Post.new post.value
        end
      end

      def find_by_id(post_id)
        Entities::Post.new Post.find(post_id).value
      end

      def first
        Entities::Post.new Post.first.value
      end

      def clear
        Post.all.map(&:destroy)
      end

      class Post < ::ActiveRecord::Base
        def value(serializer: Serializers::Pipeline)
          serializer.new(self).serialize(attrs_method: :attributes)
        end
      end
    end
  end
end
