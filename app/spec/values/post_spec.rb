require 'values/blog_post'

describe Values::BlogPost do
  it "is immutable" do
    post = Entities::Post.new body: "something"
    post = Values::BlogPost.new post: post

    expect {
      post.instance_variable_set :@body, "other thing"
    }.to raise_error
  end
end
