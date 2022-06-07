require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "GET #new" do
    before { get :new }

    it { expect(response).to have_http_status(:success) }

    it { should render_template(:new) }
  end

  describe "POST #create" do
    let(:params) { {
      user: {
        username: 'tato',
        email: 'tpanchulidze@gmail.com',
        password: 'password1234',
        password_confiramtion: 'password1234'
      }
    } }
    
    it { 
      should permit(:username, :email, :password, :password_confirmation).
        for(:create, params: params).
        on(:user)
    }
  end

  describe "#create" do
    before { post :create, :params => { 
                                          user: {
                                            username: 'tato',
                                            email: 'tpanchulidze@gmail.com',
                                            password: 'password1234',
                                            password_confiramtion: 'password1234'
                                          }
                                        }
    }

    it { should set_session}

    it { should set_flash[:notice].to('sign up successfully')}

    it { should redirect_to(root_path) }
  end

  describe "#create inavalid" do
    before { post :create, :params => { 
                                          user: {
                                            username: '',
                                            email: 'tpanchulidze@gmail.com',
                                            password: 'password1234',
                                            password_confiramtion: 'password1234'
                                          }
                                        }
    }

    it { should_not set_session }

    it { should_not set_flash}

    it { should render_template(:new) }
  end
end

