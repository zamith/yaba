require 'entities/post'
require 'contracts/post_jack_contract'
require 'spec/doubles/post_jack_double'

describe PostJackContract do
  let(:post_hash) { Post.new(id: 1, body: "First post").to_hash }

  context ".get_contract" do
    it "accepts an id as input" do
      input = { id: 1 }
      jack = PostJackDouble.create :default
      jack.add_value post_hash

      expect {
        jack.get(input)
      }.not_to raise_error
    end

    it "returns a valid post shape" do
      input = { id: 1 }
      jack = PostJackDouble.create :default
      jack.add_value post_hash

      jack.get(input).should eq post_hash
    end
  end
end
