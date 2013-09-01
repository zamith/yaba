require 'obvious'
require 'entities/post'

class GetPost
  include Obvious::Obj

  def initialize(jack)
    @jack = jack
  end

  define :execute, where_id: [:id, Fixnum] do |input|
    data = jack.get id: input[:id]
    post = Post.new data
    post.to_hash
  end

  private
  attr_reader :jack
end
