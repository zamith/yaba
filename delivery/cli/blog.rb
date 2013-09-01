#!/usr/bin/env ruby

require 'commander/import'
require 'pry'

require_relative '../../config'
$:.unshift APP_ROOT
$:.unshift EXTERNAL_ROOT

require "#{APP_ROOT}/actions/get_post"
require "#{EXTERNAL_ROOT}/post_jack"

program :name, 'YABA (Yet Another Blog Application)'
program :version, '1.0'
program :description, 'The cli version of YABA'

command :get do |c|
  c.action do |args, options|
    entity = args[0]
    id = args[1]
    if entity == 'post'
      get_post = GetPost.new PostJack.new
      post = get_post.execute where_id: id.to_i
      puts "Post number #{post[:id]}"
      puts post[:body]
    end
  end
end
