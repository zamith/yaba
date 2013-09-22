require 'json'

module Values
  class Post
    attr_reader :body

    def initialize(body: "")
      @body = body
      freeze
    end

    def value
      {body: body}.to_json
    end
  end
end
