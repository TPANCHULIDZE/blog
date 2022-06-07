class DestroyPostsController < ApplicationController
  before_action :require_user_loged_in!

  def destroy
    post = Post.find_by(id: params[:format])
   
    if post
      post.destroy
      redirect_to user_posts_path, notice: "post is delete successfully"
    else
      redirect_to user_posts_path, alert: "post is not exist"
    end
  end
end

