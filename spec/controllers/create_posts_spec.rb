require 'rails_helper'

RSpec.describe CreatePostsController, type: :controller do
  let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
  before { session[:user_id] = user.id }

  it { should use_before_action(:require_user_loged_in!) }

  it { should use_before_action(:set_current_user) }

  describe "GET /new" do
    before { get :new }
      
    it { should render_template('new') }   
  end

  describe "POST /create" do
    let(:params){ 
      {
        post: {
          author: 'tato',
          title: 'new post',
          body: 'this is post test'
        }
      }
    }
    before { post :create, params: params }

    it{ should redirect_to(user_posts_path) }

    it { should set_flash[:notice].to("post is create") }
  end

  describe "POST /create invalid" do
    let(:params){ 
      {
        post: {
          author: 'tato',
          title: '',
          body: 'this is post test'
        }
      }
    }
    before { post :create, params: params  }

    it { should set_flash[:alert].to("invalid input") }
  end

  describe "params" do
    let(:params){ 
      {
        post: {
          author: 'tato',
          title: 'new post',
          body: 'this is post test'
        }
      }
    }
    it { 
      should permit(:author, :title, :body).for(:create, params: params).on(:post)
    }
  end
end

