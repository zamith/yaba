require "#{APP_ROOT}/entities/post"

module Services
  class UpdatesPosts
    include Wisper::Publisher

    def initialize(post: post)
      @post = post
    end

    def apply_changes(changes = {})
      new_post = Entities::Post.new post.value.merge(format(changes))
      publish(:updated_post, new_post)
      new_post
    end

    private
    attr_reader :post, :repo

    def format(changes)
      Hash[changes.map{|k, v| [k.to_sym, v]}]
    end
  end
end
