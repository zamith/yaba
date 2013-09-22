require 'fixtures/initialized_repository'
require 'repository'

describe Repository do
  let(:post_repo) { Repository.for(:post) }

  context ".register" do
    it "allows new repositories to be registered" do
      Repository.register :post, post_repo
    end
  end

  context ".for" do
    it "allows me to get a repository I have registered" do
      Repository.register :post, post_repo

      expect(Repository.for(:post)).to eq(post_repo)
    end
  end
end
