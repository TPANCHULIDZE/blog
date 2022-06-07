require 'rails_helper'

RSpec.describe UpdatePostsController, type: :controller do
  let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
  before { session[:user_id] = user.id }
  let(:post) { user.posts.create(author: 'tato', title: 'new pst', body: 'this is new post') }

  it { should use_before_action(:require_user_loged_in!) }

  it { should use_before_action(:set_current_user) }

  describe "GET /edit" do
    before { get :edit }
      
    it { should render_template(:edit) }       
  end

  describe "params" do
    let(:params) { {
      post: {
        author: user.username,
        title: 'new post',
        body: 'new post params'
      },
      format: post.id
    }}

    it { should permit(:author, :title, :body).for(:update, params: params).on(:post) }
  end

  describe "PATCH /update" do
    before { patch :update,  params: {
                              post: {
                                author: 'tato',
                                title: 'new post',
                                body: 'this is new post'
                              },
                              format: post.id
                            } 
    }
      
    it { should redirect_to(user_posts_path) } 

    it { should set_flash[:notice].to("post update successfully") }      
  end
  describe "PATCH /update invalid" do
    before { patch :update,  params: {
                              post: {
                                author: 'tato',
                                title: nil,
                                body: 'this is new post'
                              },
                              format: post.id
                            } 
    }
      
    it { should render_template(:edit) }   
  end
end
