class Blogger < ApplicationRecord
    attr_accessor :featured_post
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}
    validates :age, length: {minimum: 1}
    has_many :posts, dependent: :destroy 
    has_many :destinations, through: :posts

    def featured_post
        posts = self.posts.sort_by { |post| post.likes }.reverse
        featured_post = posts[0]
    end 

    def total_likes
        user_posts = self.posts.all
        likes_array = user_posts.map {|blogger| blogger.likes}
        total_likes = likes_array.reduce(0, :+)
    end

end
