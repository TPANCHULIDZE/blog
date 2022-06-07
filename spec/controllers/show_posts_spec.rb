require 'rails_helper'

RSpec.describe ShowPostsController, type: :controller do
  let(:user) { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', password: 'password123', password_confirmation: 'password123')}
  before { session[:user_id] = user.id }

  it { should_not use_before_action(:require_user_loged_in!) }

  it { should use_before_action(:set_current_user) }

  describe "GET /show" do
    before { get :show }
      
    it { should render_template(:show) }       
  end
end


