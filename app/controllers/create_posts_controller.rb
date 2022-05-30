class CreatePostsController < ApplicationController
  before_action :require_user_loged_in!

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.create(posts_params)
    if @post.save
      redirect_to user_posts_path, notice: "post is create"
    else
      render :new
    end
  end

  private

  def posts_params
    params.require(:post).permit(:author, :title, :body)
  end
end
