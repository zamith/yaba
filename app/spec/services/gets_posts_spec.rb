require 'spec_helper'
require 'fixtures/initialized_repository'
require 'services/gets_posts'
require 'json'

describe Services::GetsPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#first" do
    it "gets the first post" do
      post = Entities::Post.new body: "A nice post"
      repo.save post

      expect(Services::GetsPosts.new.first.value).to eq post.value
    end
  end

  context "#all" do
    it "gets all the posts" do
      first = Entities::Post.new body: "first one"
      second = Entities::Post.new body: "second one"
      repo.save first
      repo.save second

      expect(Services::GetsPosts.new.all.map(&:value)).to eq [first.value, second.value]
    end
  end
end
