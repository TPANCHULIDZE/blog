require "rails_helper"

RSpec.describe "routes for Post", type: :routing do
  it { should route(:get, '/show_post').to(controller: :show_posts, action: :show) }
end

