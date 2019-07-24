class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all 
  end

  def show
    @destination = Destination.find(params[:id])
    @recent_posts = @destination.posts.sort_by {|post| post.created_at}.reverse
    @posts = @recent_posts[0...4]

  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def delete
  end
end
