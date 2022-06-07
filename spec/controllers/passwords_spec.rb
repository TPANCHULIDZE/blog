require 'rails_helper'
require 'capybara/rails'

RSpec.describe PasswordsController, type: :controller do
  describe "before action" do
    it { should use_before_action(:require_user_loged_in!) }

    it { should use_before_action(:set_current_user) }

    it { should_not use_before_action(:current_user) }
  end

  describe "GET #edit" do
    let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
    before { session[:user_id] = user.id }

    before { get :edit }

    it { should render_template(:edit)}
  end

  describe 'PATCH #update' do
    let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
    
    before { session[:user_id] = user.id }

    before { patch :update, params: {
                              user: {
                                old_password: 'password123',
                                password: 'password1234',
                                password_confirmation: 'password1234'
                              }
                            }
    }

    it { should redirect_to(root_path) }

    it { should set_flash[:notice].to("successfully update password")}
  end

  describe 'PATCH #update invalid current_user password' do
    let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
    
    before { session[:user_id] = user.id }

    before { patch :update, params: {
                              user: {
                                old_password: 'password12',
                                password: 'password1234',
                                password_confirmation: 'password1234'
                              }
                            }
    }

    it { should render_template(:edit) }
  end

  describe 'PATCH #update invalid password ans password_confirmation' do
    let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
    
    before { session[:user_id] = user.id }

    before { patch :update, params: {
                              user: {
                                old_password: 'password123',
                                password: 'password12345',
                                password_confirmation: 'password1234'
                              }
                            }
    }

    it { should render_template(:edit) }
  end
end

