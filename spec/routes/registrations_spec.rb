require "rails_helper"

RSpec.describe "routes for User", type: :routing do
  it { should route(:get, '/sign_up').to(controller: :registrations, action: :new) }

  it { should route(:post, '/sign_up').to(controller: :registrations, action: :create) }
end


