require 'contracts/post_jack_contract'

class PostJackDouble
  def self.create(behavior)
    const_get("#{behavior.to_s.capitalize}PostJack").new
  end
end

class DefaultPostJack < PostJackContract
  def initialize
    @values = {}
  end

  def add_value(value)
    @values[value[:id]] = value
  end

  def get(input)
    @values[input[:id]]
  end
end
