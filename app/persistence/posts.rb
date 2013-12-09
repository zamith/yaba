require "#{APP_ROOT}/repository"

module Persistence
  class Posts
    def initialize
      @repo = Repository.for(:post)
    end

    def updated_post(post)
      repo.update post
    end

    def created_post(post)
      repo.save post
    end

    def deleted_post(post_id)
      repo.delete post_id
    end

    private
    attr_reader :repo
  end
end

