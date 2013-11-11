require 'entities/post'

module Services
  class UpdatesPosts
    def initialize(post: post)
      @post = post
    end

    def apply_changes(changes = {})
      Entities::Post.new post.value.merge(changes)
    end

    private
    attr_reader :post
  end
end
