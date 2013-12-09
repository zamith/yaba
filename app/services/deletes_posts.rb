require "#{APP_ROOT}/persistence/posts"
require 'wisper'

module Services
  class DeletesPosts
    include Wisper::Publisher

    def initialize(post_id: nil)
      @post_id = post_id
    end

    def delete
      publish(:deleted_post, post_id)
    end

    private
    attr_reader :post_id
  end
end
