require 'entities/post'

describe Post do
  it "has a shape" do
    Post.shape.should_not be_nil
  end

  it "has a body" do
    Post.shape.keys.should include :body
  end
end
