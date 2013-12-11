require 'spec_helper'
require 'interactors/deletes_posts'
require 'entities/post'

describe Interactors::DeletesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#delete" do
    it "deletes a post" do
      post = repo.save Entities::Post.new body: "great post"
      deleter = Interactors::DeletesPosts.new(post_id: post.id)

      deleter.delete

      expect{ repo.find_by_id(post.id) }.to raise_error RecordNotFound
    end
  end
end
