require "rails_helper"

RSpec.describe "routes for Post", type: :routing do
   
   it { should route(:get, '/posts').to(controller: :posts, action: :index) } 
  

   it { should route(:get, 'user_posts').to(controller: :posts, action: :show) }
end

