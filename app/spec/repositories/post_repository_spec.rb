require 'fixtures/initialized_repository'
require 'entities/post'

describe "PostsRepository" do
  let(:repo) { Repository.for(:post) }
  let(:valid_post) { Values::Post.new }

  context "#save" do
    it "saves a post" do
      expect(repo.save(valid_post)).to be_true
    end
  end

  context "#find_by_id" do
    it "finds a saved post by id" do
      first_id = 1
      repo.save valid_post

      expect(repo.find_by_id(first_id)).to eq(valid_post)
    end
  end
end
