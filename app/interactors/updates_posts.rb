require "#{APP_ROOT}/entities/post"
require "#{APP_ROOT}/persistence/posts"
require 'wisper'

module Interactors
  class UpdatesPosts
    include Wisper::Publisher

    def initialize(post: post)
      @post = post
    end

    def apply_changes(changes = {})
      changed_post = Entities::Post.new post.value.merge(format(changes))
      publish(:updated_post, changed_post)
      changed_post
    end

    private
    attr_reader :post

    def format(changes)
      Hash[changes.map{|k, v| [k.to_sym, v]}]
    end
  end
end
