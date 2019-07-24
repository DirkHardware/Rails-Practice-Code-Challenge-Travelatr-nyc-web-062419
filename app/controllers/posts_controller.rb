class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end

  def show
    @post = Post.all.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit 
    end 
  end

  def like 
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.update(likes: @post.likes)
      render :show 
  end 

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.likes = 0 
      @post.save
    else
      render :new 
    end 
  end

  def delete
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id, :created_at, :updated_at )
  end 
end
