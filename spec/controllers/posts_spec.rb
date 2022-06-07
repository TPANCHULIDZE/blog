require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it { should use_before_action(:require_user_loged_in!)}
  it { should use_before_action(:set_current_user) }

  describe "GET /index" do
    before { get :index }
      
    it { should render_template('index') } 
  end

  describe "GET /show" do
    let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
    before { session[:user_id] = user.id }

    before { get :show }

    it { should render_template(:show) }
  end
end

