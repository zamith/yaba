module Services
  class SavesPosts
    def initialize
      @repo = Repository.for(:post)
    end

    def updated_post(post)
      repo.update post
    end

    private
    attr_reader :repo
  end
end

