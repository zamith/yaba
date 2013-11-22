require "#{APP_ROOT}/serializers/pipeline"

module Entities
  class Post
    attr_reader :id, :body

    def initialize(args = {})
      @id = args[:id] || args.fetch("id", 0)
      @body = args[:body] || args.fetch("body", "")
      freeze
    end

    def value(serializer: Serializers::Pipeline)
      serializer.new(self).serialize
    end
  end
end
