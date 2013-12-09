require 'spec_helper'
require 'services/creates_posts'

describe Services::CreatesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#create" do
    it "returns a new post object when it is created" do
      post_params = { body: "Great Post!" }

      result = Services::CreatesPosts.new(post_params: post_params).create

      result.body.should == post_params[:body]
    end
  end
end
