require 'rails_helper'

RSpec.describe DestroyPostsController, type: :controller do
  let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
  before { session[:user_id] = user.id }
  let(:post) { user.posts.create(author: 'tato', title: 'new pst', body: 'this is new post') }

  it { should use_before_action(:require_user_loged_in!) }

  it { should use_before_action(:set_current_user) }

  describe "DELETE /destroy" do
    before { delete :destroy, params: { format: post.id } }
      
    it { should redirect_to(user_posts_path) }  

    it { should set_flash[:notice].to("post is delete successfully") }     
  end

  describe "DELETE /destroy" do
    before { delete :destroy, params: { format: 1 } }
      
    it { should redirect_to(user_posts_path) }  

    it { should set_flash[:alert].to("post is not exist") }     
  end
end
