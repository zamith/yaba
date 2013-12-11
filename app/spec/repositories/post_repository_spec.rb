require 'spec_helper'
require 'entities/post'

describe "PostsRepository" do
  let(:repo) { Repository.for(:post) }
  let(:valid_post) { Entities::Post.new }

  after :each do
    repo.clear
  end

  context "#save" do
    it "saves a post" do
      expect(repo.save(valid_post)).to be_true
    end

    it "can save more than one post" do
      repo.save valid_post
      repo.save valid_post

      expect(repo.all.size).to eq 2
    end
  end

  context "#delete" do
    it "deletes a post from its id" do
      post = repo.save valid_post

      repo.delete post.id

      expect{ repo.find_by_id(post.id) }.to raise_error RecordNotFound
    end

    it "deletes a post from its id even when the id is a string" do
      post = repo.save valid_post

      repo.delete post.id.to_s

      expect{ repo.find_by_id(post.id) }.to raise_error RecordNotFound
    end
  end

  context "#update" do
    it "updates a post" do
      expect(repo.update(valid_post)).to be_true
    end
  end

  context "#find_by_id" do
    it "finds a saved post by id" do
      first_id = 1
      persisted_valid_post = repo.save valid_post

      expect(repo.find_by_id(first_id)).to eq(persisted_valid_post)
    end

    it "raise an exception if the post is not there" do
      expect{ repo.find_by_id(1) }.to raise_error RecordNotFound
    end
  end

  context "#first" do
    it "gets the first post" do
      first = Entities::Post.new body: "first one"
      persisted_first_post = repo.save first
      repo.save Entities::Post.new body: "second one"

      expect(repo.first).to eq persisted_first_post
    end
  end

  context "#all" do
    it "gets all the posts" do
      first = repo.save Entities::Post.new body: "first one"
      second = repo.save Entities::Post.new body: "second one"

      expect(repo.all).to eq [first, second]
    end
  end

  context "#last" do
    it "gets the last post" do
      first = repo.save Entities::Post.new body: "first one"

      expect(repo.last).to eq first
    end

    it "gets the last 2 posts" do
      first = repo.save Entities::Post.new body: "first one"
      second = repo.save Entities::Post.new body: "second one"

      expect(repo.last(2)).to eq  [second, first]
    end
  end
end
