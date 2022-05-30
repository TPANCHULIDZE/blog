class PostsController < ApplicationController
  before_action :require_user_loged_in!, only: [:show]
  
  def index
    @posts = Post.all
  end

  def show  
    @posts = Current.user.posts
  end
end
