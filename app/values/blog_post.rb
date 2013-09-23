require 'json'

module Values
  class BlogPost
    attr_reader :body

    def initialize(post: post)
      @body = post.body
      freeze
    end

    def value
      {body: body}.to_json
    end
  end
end
