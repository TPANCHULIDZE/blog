class ShowPostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:format])
  end
end

