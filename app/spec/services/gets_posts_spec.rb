require 'spec_helper'
require 'fixtures/initialized_repository'
require 'services/gets_posts'

describe Services::GetsPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#first" do
    it "gets the first post" do
      post = repo.save Entities::Post.new body: "A nice post"

      expect(Services::GetsPosts.new.first.value).to eq post.value
    end
  end

  context "#all" do
    it "gets all the posts" do
      first = repo.save Entities::Post.new body: "first one"
      second = repo.save Entities::Post.new body: "second one"

      expect(Services::GetsPosts.new.all.map(&:value)).to eq [first.value, second.value]
    end
  end
end
