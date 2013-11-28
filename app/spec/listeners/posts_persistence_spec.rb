require 'spec_helper'
require 'entities/post'
require 'listeners/posts_persistence'
require 'fixtures/initialized_repository'

describe Listeners::PostsPersistence do
  let(:repo) { Repository.for(:post) }
  let(:listener) { Listeners::PostsPersistence.new }

  after :each do
    repo.clear
  end

  context "#updated_post" do
    it "saves the updated post" do
      changed_post = Entities::Post.new id: 1, body: "random text"

      repo.should_receive(:update).with(changed_post)

      listener.updated_post(changed_post)
    end
  end

  context "#created_post" do
    it "saves the newly created post" do
      new_post = Entities::Post.new body: "random text"

      repo.should_receive(:save).with(new_post)

      listener.created_post(new_post)
    end
  end

  context "#deleted_post" do
    it "deletes the post" do
      post_id = 1

      repo.should_receive(:delete).with(post_id)

      listener.deleted_post(post_id)
    end
  end
end
