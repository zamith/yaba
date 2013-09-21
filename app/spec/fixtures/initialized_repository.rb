require 'repository'
require 'repositories/posts/memory'

Repository.register :post, Repositories::Posts::Memory.new
