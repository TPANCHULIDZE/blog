require "rails_helper"

RSpec.describe "routes for Post", type: :routing do
  it { should route(:delete, '/delete_post').to(controller: :destroy_posts, action: :destroy) }
end

