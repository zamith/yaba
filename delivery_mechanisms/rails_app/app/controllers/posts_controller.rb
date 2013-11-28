require 'draper'
require "#{APP_ROOT}/services/gets_posts"
require "#{APP_ROOT}/services/creates_posts"
require "#{APP_ROOT}/services/updates_posts"
require "#{APP_ROOT}/services/deletes_posts"

class PostsController < ApplicationController
  def index
    @posts = PostDecorator.decorate_collection(Services::GetsPosts.new.all)
  end

  def show
    @post = PostDecorator.decorate(Services::GetsPosts.new.get(post_id: params[:id]))
  end

  def new
    @post = PostDecorator.decorate(Entities::Post.new)
  end

  def create
    Services::CreatesPosts.new(post_params: post_params).create

    redirect_to posts_path
  end

  def edit
    @post = PostDecorator.decorate(Services::GetsPosts.new.get(post_id: params[:id]))
  end

  def update
    post = Services::GetsPosts.new.get(post_id: params[:id])
    Services::UpdatesPosts.new(post: post).apply_changes(post_params)

    redirect_to posts_path
  end

  def destroy
    Services::DeletesPosts.new(post_id: params[:id]).delete

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
