class PostsController < ApplicationController
  def index
    # instance param
    @posts = Post.all

  end
end