class CreateCommentsController < ApplicationController
  def new
  end

  def create
    @post = Post.find_by(id: params[:format])
    @comment = @post.comments.new(comments_params)
    @comment.save

    redirect_to show_post_path(@post)
  end

  private

  def comments_params
    # params[:comment][:user_id] = session[:user_id]
    params.require(:comment).permit(:description, :user_id)
  end
end