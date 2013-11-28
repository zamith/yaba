require 'mongoid'
require "#{APP_ROOT}/entities/post"
require "#{APP_ROOT}/serializers/mongoid"

module Repositories
  module Posts
    class Mongoid
      def initialize
        @next_id = 1
      end

      def all
        result = Post.all.map do |post|
          Entities::Post.new post.value
        end
      end

      def save(post)
        post_value = post.value
        post_value.delete :id
        post = Entities::Post.new Post.create(post_value.merge(uid: next_id)).value
        @next_id + 1
        post
      end

      def update(post)
        old_post = Post.find_by(uid: post.id)
        old_post.update_attributes db_value(post)
      end

      def delete(post_id)
        Post.find_by(uid: post_id).destroy
      end

      def find_by_id(post_id)
        Entities::Post.new Post.find_by(uid: post_id).value
      end

      def first
        Entities::Post.new Post.first.value
      end

      def clear
        Post.destroy_all
      end

      private
      def next_id
        if id = Post.last.try(:uid)
          id + 1
        else
          @next_id
        end
      end

      def db_value(post)
        post_value = post.value
        post_value[:uid] = post_value.delete :id
        post_value
      end

      class Post
        include ::Mongoid::Document
        field :uid, type: Integer
        field :body, type: String

        def value(serializer: Serializers::Mongoid)
          serializer.new(self).serialize(id_attr: :uid)
        end
      end
    end
  end
end
