require 'spec_helper'
require 'fixtures/initialized_repository'
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

      expect(repo.find_by_id(2)).to_not be_nil
    end
  end

  context "#find_by_id" do
    it "finds a saved post by id" do
      first_id = 1
      repo.save valid_post

      expect(repo.find_by_id(first_id)).to eq(valid_post)
    end
  end

  context "#first" do
    it "gets the first post" do
      first = Entities::Post.new body: "first one"
      repo.save first
      repo.save Entities::Post.new body: "second one"

      expect(repo.first).to eq first
    end
  end

  context "#all" do
    it "gets all the posts" do
      first = Entities::Post.new body: "first one"
      second = Entities::Post.new body: "second one"
      repo.save first
      repo.save second

      expect(repo.all).to eq [first, second]
    end
  end
end
