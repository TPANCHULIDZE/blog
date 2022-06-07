require "rails_helper"

RSpec.describe "routes for Post", type: :routing do
  it {should route(:get, '/create_post').to(controller: :create_posts, action: :new) } 

  it { should route(:post, '/create_post').to(controller: :create_posts, action: :create) }
end

