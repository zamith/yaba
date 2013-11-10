module Service
  class PostValidator
    def initialize(post_titles)
      @post_titles = post_titles
    end
    
    def apply(posts)
      posts.map do |post|
        validate(post)
      end
    end

    def validate(post)
      return InvalidPost.new(post, "Null body not allowed!") if post.body.nil?
      return InvalidPost.new(post, "Title not unique!") if @post_titles.include?(post.title)
      ValidPost.new(post)
    end
  end
end
