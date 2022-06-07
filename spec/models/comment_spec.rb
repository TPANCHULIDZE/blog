require 'rails_helper'

RSpec.describe Comment, :type => :model do
  subject(:user) { User.create(username: "tato", email: "tpanchulidze@gmail.com}", password: "tato1234", password_confirmation: "tato1234")}
  subject(:post) { Post.create(author: "tato", title: "post", body: "this is first post", user_id: user.id) }
  subject { described_class.new(description: "good post", post_id: post.id, user_id: user.id) }


  describe "Associations User" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Associations Post" do
    it { should belong_to(:post).without_validating_presence }
  end

  describe "Validating" do
    it { should validate_presence_of(:description)}
  end
end

