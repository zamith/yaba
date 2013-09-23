module Services
  class GetsPosts
    def initialize
      @repo = Repository.for(:post)
    end

    def get(post_id: 0)
      Values::BlogPost.new(post: repo.find_by_id(post_id)).value
    end

    def first
      Values::BlogPost.new(post: repo.first).value
    end

    private
    attr_reader :repo
  end
end
