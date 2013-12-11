require 'spec_helper'
require 'interactors/gets_posts'

describe Interactors::GetsPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#first" do
    it "gets the first post" do
      post = repo.save Entities::Post.new body: "A nice post"

      expect(Interactors::GetsPosts.new.first.value).to eq post.value
    end
  end

  context "#all" do
    it "gets all the posts" do
      first = repo.save Entities::Post.new body: "first one"
      second = repo.save Entities::Post.new body: "second one"

      expect(Interactors::GetsPosts.new.all.map(&:value)).to eq [first.value, second.value]
    end
  end
end
