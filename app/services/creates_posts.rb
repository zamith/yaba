require "#{APP_ROOT}/entities/post"
require "#{APP_ROOT}/persistence/posts"

module Services
  class CreatesPosts
    def initialize(post_params: {})
      @post_params = post_params
    end

    def create
      new_post = Entities::Post.new post_params
      Persistence::Posts.new.create(new_post)
    end

    private
    attr_reader :post_params
  end
end
