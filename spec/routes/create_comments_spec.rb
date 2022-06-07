require "rails_helper"

RSpec.describe "routes for Comment", type: :routing do

  it "create comments  get routes" do
    should route(:get, '/create_comments').to(controller: :create_comments, action: :new)
  end

  it "create comments post routes" do
    should route(:post, '/create_comments').to(controller: :create_comments, action: :create)
  end
end

