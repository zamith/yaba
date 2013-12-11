require 'draper'
require "#{APP_ROOT}/interactors/gets_posts"
require "#{APP_ROOT}/interactors/creates_posts"
require "#{APP_ROOT}/interactors/updates_posts"
require "#{APP_ROOT}/interactors/deletes_posts"

class PostsController < ApplicationController
  def index
    @posts = PostDecorator.decorate_collection(Interactors::GetsPosts.new.all)
  end

  def show
    @post = PostDecorator.decorate(Interactors::GetsPosts.new.get(post_id: params[:id]))
  end

  def new
    @post = PostDecorator.decorate(Entities::Post.new)
  end

  def create
    Interactors::CreatesPosts.new(post_params: post_params).create

    redirect_to posts_path
  end

  def edit
    @post = PostDecorator.decorate(Interactors::GetsPosts.new.get(post_id: params[:id]))
  end

  def update
    post = Interactors::GetsPosts.new.get(post_id: params[:id])
    Interactors::UpdatesPosts.new(post: post).apply_changes(post_params)

    redirect_to posts_path
  end

  def destroy
    Interactors::DeletesPosts.new(post_id: params[:id]).delete

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
