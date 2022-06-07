require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET /new" do
    before { get :new }
      
    it { expect(response).to have_http_status(:success) }

    it { should render_template(:new) } 
  end

  describe "POST /create valid user" do
    before { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', 
      password: 'password1234', password_confirmation: 'password1234')}

    before { post :create, params: {username: 'tato', password: 'password1234'} }

   it { should respond_with(:found) }

   it { should set_session }

   it { should set_flash[:notice].to("sign in successfully") }

   it { should redirect_to(root_path) }
  end

  describe "POST /create invalid user" do
    before { User.create(username: 'tato', email: 'tpanchulidze@gmail.com', 
      password: 'password1234', password_confirmation: 'password1234')}

    before { post :create, params: {username: 'tato', password: 'password123'} }

   it { should_not respond_with(:found) }

   it { should set_flash[:alert].to("invalid username or password") }

   it { should render_template(:new) }
  end

  describe "DELETE /destroy" do
    before  { delete :destroy }

    it "current user is nil" do
      expect(Current.user).to be_nil
    end

    it { should set_session[:user_id].to(nil) }

    it { should set_flash[:notice].to("log out successfully") }

    it { should redirect_to(root_path) }
  end
end


