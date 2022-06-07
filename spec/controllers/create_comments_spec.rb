require 'rails_helper'

RSpec.describe CreateCommentsController, type: :controller do
  let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
  before { session[:user_id] = user.id }
  let(:post1) { user.posts.create(author: 'tato', title: 'new pst', body: 'this is new post') }

  it { should use_before_action(:require_user_loged_in!) }

  it { should use_before_action(:set_current_user) }

  describe "POST /create" do
    let(:params){ 
      {
        comment: {
          description: 'new comment',
          user_id: user.id
        },
        format: post1.id
      }
    }

    it { should permit(:description, :user_id).for(:create, params: params).on(:comment)}
  end

  describe "POST /create" do
    let(:params){ 
      {
        comment: {
          description: 'new comment',
          user_id: user.id
        },
        format: post1.id
      }
    }

    before { post :create, params: params }

    it { should redirect_to(show_post_path(post1)) }

    it { should set_flash[:notice].to("create comment") }
  end

  describe "POST /create" do
    let(:params){ 
      {
        comment: {
          description: nil,
          user_id: user.id
        },
        format: post1.id
      }
    }

    before { post :create, params: params }

    it { should redirect_to(show_post_path(post1)) }

    it { should set_flash[:alert].to("comment don't create")}
  end
 
end

