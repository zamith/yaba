module Listeners
  class PostsPersistence
    def initialize
      @repo = Repository.for(:post)
    end

    def updated_post(post)
      repo.update post
    end

    def created_post(post)
      repo.save post
    end

    private
    attr_reader :repo
  end
end

