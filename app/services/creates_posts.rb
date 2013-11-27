require "#{APP_ROOT}/entities/post"
require 'wisper'

module Services
  class CreatesPosts
    include Wisper::Publisher

    def initialize(post_params: {})
      @post_params = post_params
    end

    def create
      new_post = Entities::Post.new post_params
      publish(:created_post, new_post)
      new_post
    end

    private
    attr_reader :post_params
  end
end
