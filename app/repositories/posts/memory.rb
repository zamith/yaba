class RecordNotFound < StandardError; end

module Repositories
  module Posts
    class Memory
      def initialize
        @posts = {}
        @next_id = 1
      end

      def all
        posts.values
      end

      def save(post)
        post = Entities::Post.new post.value.merge(id: next_id)
        posts[next_id] = post
        @next_id += 1
        post
      end

      def update(post)
        posts[post.id] = post
      end

      def delete(post_id)
        posts.delete post_id.to_i
      end

      def find_by_id(post_id)
        post = posts[post_id.to_i]
        raise RecordNotFound unless post
        post
      end

      def first
        posts.first[1]
      end

      def clear
        @posts = {}
        @next_id = 1
      end

      private
      attr_reader :posts, :next_id
    end
  end
end
