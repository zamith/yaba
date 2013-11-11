require "#{APP_ROOT}/services/gets_posts"

class PostsController < ApplicationController
  def index
    @posts = repo.all
  end

  def show
    @post = Services::GetsPosts.get(params[:id])
  end

  private
  def repo
    @_repo ||= Repository.for(:post)
  end
end
