require 'spec_helper'
require 'interactors/creates_posts'

describe Interactors::CreatesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#create" do
    it "returns a new post object when it is created" do
      post_params = { body: "Great Post!" }

      result = Interactors::CreatesPosts.new(post_params: post_params).create

      result.body.should == post_params[:body]
    end
  end
end
