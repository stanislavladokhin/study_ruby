class PostsController < ApplicationController
before_action :post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:show]
  def index
    # instance param
    @posts = Post.all

  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    puts params
    Post.create(post_params)
    #flash[:notice] = "Post was succesfully created"
    redirect_to posts_path, notice: "Post was succesfully created"
  end

  def edit 
  end

  def update
    @post.assign_attributes(post_params)
    if @post.save
      flash[:notice] = "Post was succesfully updated"
    else
      flash[:notice] = "Post was not succesfully updated"
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
      flash[:notice] = "Post was succesfully deleted"
    redirect_to posts_path
  end

  

  private
    def post
      @post ||= Post.find( params[:id] )
    end

    def post_params
      params.require(:post).permit(:title, :text)
    end 

    helper_method :post
end
