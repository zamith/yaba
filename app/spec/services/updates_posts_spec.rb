require 'services/updates_posts'

describe Services::UpdatesPosts do
  context "#apply_changes" do
    it "changes the title of a post" do
      post = Entities::Post.new body: "random text"
      new_post_body = "I'm the new post"

      changed_post = Services::UpdatesPosts.new(post: post).apply_changes(body: new_post_body)

      expect(changed_post.body).to eq new_post_body
    end
  end
end
