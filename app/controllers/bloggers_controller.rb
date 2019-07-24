class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all 
  end

  def show
    @blogger = Blogger.find(params[:id])
    if @blogger.featured_post = nil 
      @blogger.featured_post = post_path(index)
    end 
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else 
      render :edit 
    end 
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else 
      render :new 
    end 
  end

  def delete
  end

  private 

  def blogger_params 
    params.require(:blogger).permit(:name, :bio, :age, :created_at, :updated_at)
  end 

end
