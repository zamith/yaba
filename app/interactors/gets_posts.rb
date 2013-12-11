require "#{APP_ROOT}/repository"
require "#{APP_ROOT}/entities/post"

module Interactors
  class GetsPosts
    NUMBER_OF_RECENT_POSTS = 10

    def initialize(no_recent: NUMBER_OF_RECENT_POSTS)
      @repo = Repository.for(:post)
      @no_recent = no_recent
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

    def recent
      repo.last(no_recent) do |post|
        Entities::Post.new(post.value)
      end
    end

    private
    attr_reader :repo, :no_recent
  end
end
