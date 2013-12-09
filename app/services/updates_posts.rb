require "#{APP_ROOT}/entities/post"
require "#{APP_ROOT}/persistence/posts"

module Services
  class UpdatesPosts
    def initialize(post: post)
      @post = post
    end

    def apply_changes(changes = {})
      changed_post = Entities::Post.new post.value.merge(format(changes))
      Persistence::Posts.new.update(changed_post)
    end

    private
    attr_reader :post, :repo

    def format(changes)
      Hash[changes.map{|k, v| [k.to_sym, v]}]
    end
  end
end
