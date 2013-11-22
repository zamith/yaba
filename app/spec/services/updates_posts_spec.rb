require 'spec_helper'
require 'services/updates_posts'
require 'fixtures/initialized_repository'

describe Services::UpdatesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#apply_changes" do
    it "changes the title of a post" do
      post = Entities::Post.new body: "random text"
      new_post_body = "I'm the new post"

      changed_post = Services::UpdatesPosts.new(post: post).apply_changes(body: new_post_body)

      expect(changed_post.body).to eq new_post_body
    end

    it "works even when the keys are strings" do
      post = Entities::Post.new body: "random text"
      new_post_body = "I'm the new post"

      changed_post = Services::UpdatesPosts.new(post: post).apply_changes("body" => new_post_body)

      expect(changed_post.body).to eq new_post_body
    end

    it "saves the new post" do
      changed_post = Entities::Post.new id: 1, body: "random text"
      Entities::Post.stub(:new).and_return(changed_post)

      repo.should_receive(:update).with(changed_post)

      Services::UpdatesPosts.new(post: changed_post).apply_changes
    end
  end
end
