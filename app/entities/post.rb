require 'json'
require 'serializers/pipeline'

module Entities
  class Post
    attr_reader :body

    def initialize(body: "")
      @body = body
      freeze
    end

    def value(serializer: Serializers::Pipeline)
      serializer.new(self).serialize
    end
  end
end
