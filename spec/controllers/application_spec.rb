require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "before action" do
    it { should use_before_action(:set_current_user) }       
  end
end

