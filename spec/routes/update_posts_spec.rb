require "rails_helper"

RSpec.describe "routes for Post", type: :routing do
  it { should route(:get, '/update_post').to(controller: :update_posts, action: :edit) }

  it { should route(:patch, '/update_post').to(controller: :update_posts, action: :update) }
end

