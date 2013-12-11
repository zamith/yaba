require "#{APP_ROOT}/repository"
require "#{APP_ROOT}/entities/post"

module Interactors
  class GetsPosts
    def initialize
      @repo = Repository.for(:post)
    end

    def get(post_id: 0)
      Entities::Post.new(repo.find_by_id(post_id).value)
    end

    def first
      Entities::Post.new(repo.first.value)
    end

    def all
      repo.all do |post|
        Entities::Post.new(post.value)
      end
    end

    private
    attr_reader :repo
  end
end
