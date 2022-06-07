require "rails_helper"

RSpec.describe "routes for User", type: :routing do
  it { should route(:delete, '/logout').to(controller: :sessions, action: :destroy) }

  it { should route(:get, '/sign_in').to(controller: :sessions, action: :new) }

  it { should route(:post, '/sign_in').to(controller: :sessions, action: :create) }
end
