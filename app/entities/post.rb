require 'obvious'

class Post < Obvious::Entity
  value :id, Fixnum
  value :body, String
end
