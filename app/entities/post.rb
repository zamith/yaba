module Entities
  class Post
    attr_reader :body

    def initialize(body: "")
      @body = body
    end
  end
end
