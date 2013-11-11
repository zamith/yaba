module Serializers
  class Pipeline
    def initialize(object)
      @object = object
    end

    def serialize
      object.instance_variables.inject({}) do |value, ivar|
        attribute_name = var_name_to_attribute_name(ivar)
        value[attribute_name] = object.public_send(attribute_name)
        value
      end
    end

    private
    attr_reader :object

    def var_name_to_attribute_name(variable_name)
      variable_name.to_s.tr('@', '').to_sym
    end
  end
end
