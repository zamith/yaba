module Repositories
  module Posts
    class Memory
      def initialize
        @posts = {}
        @next_id = 1
      end

      def save(post)
        posts[next_id] = post
        @next_id += 1
      end

      def find_by_id(post_id)
        posts[post_id]
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
