require 'spec_helper'
require 'entities/post'
require 'services/saves_posts'
require 'fixtures/initialized_repository'

describe Services::SavesPosts do
  let(:repo) { Repository.for(:post) }

  after :each do
    repo.clear
  end

  context "#updated_post" do
    it "saves the updated post" do
      changed_post = Entities::Post.new id: 1, body: "random text"

      repo.should_receive(:update).with(changed_post)

      Services::SavesPosts.new.updated_post(changed_post)
    end
  end
end
