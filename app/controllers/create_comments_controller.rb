class CreateCommentsController < ApplicationController
  before_action :require_user_loged_in!

  def new
  end

  def create
    @post = Post.find_by(id: params[:format])
    @comment = @post.comments.new(comments_params)
    
    if @comment.save
      flash[:notice] = "create comment"
    else
      flash[:alert] = "comment don't create"
    end

    redirect_to show_post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:description, :user_id)
  end
end