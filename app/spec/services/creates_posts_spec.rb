require 'spec_helper'
require 'services/creates_posts'

describe Services::CreatesPosts do
  context "#create" do
    it "returns the new post when it is created" do
      post_params = { body: "Great Post!" }
      post = double("New Post")
      Entities::Post.stub(:new).with(post_params).and_return(post)

      result = Services::CreatesPosts.new(post_params: post_params).create

      result.should eq post
    end

    it "publishes an event for the creation of the post" do
      post_params = { body: "Great Post!" }
      new_post = double("New Post")
      Entities::Post.stub(:new).with(post_params).and_return(new_post)
      creator = Services::CreatesPosts.new(post_params: post_params)

      creator.should_receive(:publish).with(:created_post, new_post)

      creator.create
    end
  end
end
