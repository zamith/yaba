require 'spec_helper'
require 'interactors/updates_posts'
require 'entities/post'

describe Interactors::UpdatesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#apply_changes" do
    it "changes the title of a post" do
      post = Entities::Post.new body: "random text"
      new_post_body = "I'm the new post"

      changed_post = Interactors::UpdatesPosts.new(post: post).apply_changes(body: new_post_body)

      expect(changed_post.body).to eq new_post_body
    end

    it "works even when the keys are strings" do
      post = Entities::Post.new body: "random text"
      new_post_body = "I'm the new post"

      changed_post = Interactors::UpdatesPosts.new(post: post).apply_changes("body" => new_post_body)

      expect(changed_post.body).to eq new_post_body
    end

    it "updates the post in the persistence layer" do
      post = repo.save Entities::Post.new body: "random text"
      new_post_body = "I'm the new post"

      changed_post = Interactors::UpdatesPosts.new(post: post).apply_changes(body: new_post_body)

      expect(repo.find_by_id(post.id).body).to eq new_post_body
    end
  end
end
