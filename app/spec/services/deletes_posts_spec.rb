require 'spec_helper'
require 'fixtures/initialized_repository'
require 'services/deletes_posts'

describe Services::DeletesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#delete" do
    it "publishes an event for the deletion of a post" do
      post = repo.save Entities::Post.new body: "great post"
      deleter = Services::DeletesPosts.new(post_id: post.id)

      deleter.should_receive(:publish).with(:deleted_post, post.id)

      deleter.delete
    end
  end
end
