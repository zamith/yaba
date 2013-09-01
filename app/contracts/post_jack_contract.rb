require 'obvious'
require 'entities/post'

class PostJackContract < Contract
  contract_for :get, {
    input: { id: Fixnum },
    output: Post.shape
  }
end
