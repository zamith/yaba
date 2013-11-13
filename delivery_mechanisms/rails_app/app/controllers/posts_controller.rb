require "#{APP_ROOT}/services/gets_posts"

class PostsController < ApplicationController
  def index
    @posts = PostDecorator.decorate_collection(Services::GetsPosts.new.all)
  end

  def show
    @post = PostDecorator.decorate(Services::GetsPosts.new.get(post_id: params[:id]))
  end
end
