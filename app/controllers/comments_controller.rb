class CommentsController < ApplicationController
before_action :post
before_action :authenticate_user!
 
  def create
    puts params
    comment = post.comments.new(comment_params)
    comment.user = current_user
    if comment.save
      flash[:notice] = "Comment was succesfully created"
    else
      flash[:notice] = "Comment was not succesfully created"
    end
    redirect_to post_path(post)
  end
 

  private
    def post
      @post ||= Post.find( params[:post_id] )
    end

    def comment_params
      params.require(:comment).permit(:title, :message)#post_id
      #@temp=current_user
      #params.require(:post).merge(:user_id=>current_user)
    end 
  #end

    helper_method :post
end
