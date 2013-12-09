require 'spec_helper'
require 'entities/post'
require 'persistence/posts'
require 'fixtures/initialized_repository'

describe Persistence::Posts do
  let(:repo) { Repository.for(:post) }
  let(:persistence_handler) { Persistence::Posts.new }

  after :each do
    repo.clear
  end

  context "#update_post" do
    it "saves the updated post" do
      previous_post = repo.save Entities::Post.new body: "something"
      changed_post = Entities::Post.new id: previous_post.id, body: "random text"

      persistence_handler.update(changed_post)

      expect(repo.find_by_id(previous_post.id).body).to eq "random text"
    end
  end

  context "#create_post" do
    it "saves the newly created post" do
      new_post = Entities::Post.new body: "random text"

      persistence_handler.create(new_post)

      expect(repo.first.body).to eq new_post.body
    end
  end

  context "#delete_post" do
    it "deletes the post" do
      post = repo.save Entities::Post.new body: "random text"

      persistence_handler.delete(post.id)

      expect{ repo.find_by_id(post.id) }.to raise_error RecordNotFound
    end
  end
end
