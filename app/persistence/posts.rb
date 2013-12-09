require "#{APP_ROOT}/repository"

module Persistence
  class Posts
    def initialize
      @repo = Repository.for(:post)
    end

    def update(post)
      repo.update post
    end

    def create(post)
      repo.save post
    end

    def delete(post_id)
      repo.delete post_id
    end

    private
    attr_reader :repo
  end
end

