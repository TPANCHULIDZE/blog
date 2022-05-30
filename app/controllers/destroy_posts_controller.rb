class DestroyPostsController < ApplicationController
  def destroy
    post = Post.find_by(id: params[:format])
    post.destroy
    redirect_to user_posts_path, notice: "post is delete successfully"
  end
end
