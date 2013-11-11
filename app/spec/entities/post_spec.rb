require 'spec_helper'
require 'entities/post'

describe Entities::Post do
  it "is immutable" do
    post = Entities::Post.new body: "something"

    expect {
      post.instance_variable_set :@body, "other thing"
    }.to raise_error
  end
end
