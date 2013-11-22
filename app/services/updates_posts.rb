require "#{APP_ROOT}/repository"
require "#{APP_ROOT}/entities/post"

module Services
  class UpdatesPosts
    def initialize(post: post)
      @post = post
      @repo = Repository.for(:post)
    end

    def apply_changes(changes = {})
      new_post = Entities::Post.new post.value.merge(format(changes))
      repo.update new_post
      new_post
    end

    private
    attr_reader :post, :repo

    def format(changes)
      Hash[changes.map{|k, v| [k.to_sym, v]}]
    end
  end
end
