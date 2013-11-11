require "#{APP_ROOT}/services/gets_posts"

class PostsController < ApplicationController
  def index
    @posts = Services::GetsPosts.new.all
  end

  def show
    @post = Services::GetsPosts.new.get(post_id: params[:id])
  end
end
