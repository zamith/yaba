require "#{APP_ROOT}/serializers/pipeline"

module Entities
  class Post
    attr_reader :id, :body, :title

    def initialize(args = {})
      @id = args[:id] || args["id"]
      @body = args[:body] || args.fetch("body", "")
      @title = args[:title] || args.fetch("title", "")
      freeze
    end

    def ==(other)
      self.value == other.value
    end

    def value(serializer: Serializers::Pipeline)
      serializer.new(self).serialize
    end
  end
end
