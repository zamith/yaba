require 'actions/get_post'
require 'entities/post'
require 'spec/doubles/post_jack_double'

describe GetPost do
  let(:post_hash) { Post.new(id: 1, body: "First post").to_hash }

  it "gets a post and returns its hash value" do
    jack = PostJackDouble.create :default
    jack.add_value post_hash
    get_post = GetPost.new jack

    result = get_post.execute where_id: post_hash[:id]

    result.should eq post_hash
  end
end
