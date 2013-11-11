require 'spec_helper'
require 'serializers/pipeline'
require 'entities/post'

describe Serializers::Pipeline do
  it "passes the object through" do
    post_attributes = { body: "body of text" }
    post = Entities::Post.new post_attributes

    serialized_post = Serializers::Pipeline.new(post).serialize

    expect(serialized_post).to eq post_attributes
  end
end
