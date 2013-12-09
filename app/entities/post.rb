require "#{APP_ROOT}/serializers/pipeline"

module Entities
  class Post
    attr_reader :id, :body

    def initialize(args = {})
      @id = args[:id] || args["id"]
      @body = args[:body] || args.fetch("body", "")
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
