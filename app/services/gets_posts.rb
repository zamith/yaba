require "#{APP_ROOT}/entities/post"

module Services
  class GetsPosts
    def initialize
      @repo = Repository.for(:post)
    end

    def get(post_id: 0)
      Entities::Post.new(repo.find_by_id(post_id).value)
    end

    def first
      Entities::Post.new(repo.first.value)
    end

    private
    attr_reader :repo
  end
end
