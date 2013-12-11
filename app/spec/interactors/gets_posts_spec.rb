require 'spec_helper'
require 'interactors/gets_posts'

describe Interactors::GetsPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  it "gets the first post" do
    post = repo.save Entities::Post.new body: "A nice post"

    expect(Interactors::GetsPosts.new.first.value).to eq post.value
  end

  it "gets all the posts" do
    first = repo.save Entities::Post.new body: "first one"
    second = repo.save Entities::Post.new body: "second one"

    expect(Interactors::GetsPosts.new.all).to eq [first, second]
  end

  it "gets the most recent posts" do
    old = repo.save Entities::Post.new body: "first one"
    recent = repo.save Entities::Post.new body: "second one"
    more_recent = repo.save Entities::Post.new body: "third one"

    expect(Interactors::GetsPosts.new(no_recent: 2).recent).to eq [more_recent, recent]
  end
end
