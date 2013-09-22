require 'fixtures/initialized_repository'
require 'services/gets_posts'
require 'values/post'
require 'json'

describe Services::GetsPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#get" do
    it "gets the first post" do
      post_body = "A nice post"
      repo.save Values::Post.new body: post_body
      post = JSON.parse(Services::GetsPosts.new.first)

      expect(post["body"]).to eq post_body
    end
  end
end
