class UpdatePostsController < ApplicationController
  before_action :require_user_loged_in!
  
  def edit
    @post = Post.find_by(id: params[:format])
  end

  def update
    post = Post.find_by(id: params[:format])
    if post.update(post_params)
      redirect_to user_posts_path, notice: "post update successfully"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :body)
  end
end

