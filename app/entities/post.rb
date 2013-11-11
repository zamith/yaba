require "#{APP_ROOT}/serializers/pipeline"

module Entities
  class Post
    attr_reader :body

    def initialize(args = {})
      @body = args[:body] || args.fetch("body", "")
      freeze
    end

    def value(serializer: Serializers::Pipeline)
      serializer.new(self).serialize
    end
  end
end
