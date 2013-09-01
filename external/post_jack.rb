require 'contracts/post_jack_contract'
require_relative 'fs_plug'

class PostJack < PostJackContract
  def initialize(plug: :fs)
    case plug
    when :fs
      @plug = FsPlug.new "#{CLI_ROOT}/data/posts.json"
    end
  end

  def get(input)
    plug.get input
  end

  private
  attr_reader :plug
end
