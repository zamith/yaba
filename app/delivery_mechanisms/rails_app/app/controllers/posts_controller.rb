class PostsController < ApplicationController
  def index
    @posts = repo.all
  end

  def show
    @post = repo.find_by_id(params[:id])
  end

  private
  def repo
    @_repo ||= Repository.for(:post)
  end
end
