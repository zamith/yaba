require "#{APP_ROOT}/services/gets_posts"
require "#{APP_ROOT}/services/updates_posts"

class PostsController < ApplicationController
  def index
    @posts = PostDecorator.decorate_collection(Services::GetsPosts.new.all)
  end

  def show
    @post = PostDecorator.decorate(Services::GetsPosts.new.get(post_id: params[:id]))
  end

  def edit
    @post = PostDecorator.decorate(Services::GetsPosts.new.get(post_id: params[:id]))
  end

  def update
    post = Services::GetsPosts.new.get(post_id: params[:id])
    Services::UpdatesPosts.new(post: post).apply_changes(post_params)

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
