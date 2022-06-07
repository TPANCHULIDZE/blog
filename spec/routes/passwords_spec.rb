require "rails_helper"

RSpec.describe "routes for User", type: :routing do
  it { should route(:get, '/password').to(controller: :passwords, action: :edit) }

  it { should route(:patch, '/password').to(controller: :passwords, action: :update) }
end

