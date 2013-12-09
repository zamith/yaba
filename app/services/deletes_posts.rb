require "#{APP_ROOT}/persistence/posts"

module Services
  class DeletesPosts

    def initialize(post_id: nil)
      @post_id = post_id
    end

    def delete
      Persistence::Posts.new.delete(post_id)
    end

    private
    attr_reader :post_id
  end
end
