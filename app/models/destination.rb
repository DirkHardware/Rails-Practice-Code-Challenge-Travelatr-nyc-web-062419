class Destination < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :bloggers, through: :posts

    def average_age
        total_bloggers = self.bloggers.all
        ages = total_bloggers.map {|blogger| blogger.age}
        total_age = ages.reduce(0, :+)
        average_age = total_age / self.bloggers.count
    end

    def featured_post
        posts = self.posts.sort_by { |post| post.likes }.reverse
        featured_post = posts[0]
    end 
end
