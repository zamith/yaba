require 'values/post'

describe Values::Post do
  it "is immutable" do
    post = Values::Post.new body: "something"

    expect {
      post.instance_variable_set :@body, "other thing"
    }.to raise_error
  end
end
