require 'rails_helper'

RSpec.describe Post, :type => :model do
  subject(:user) { User.create(username: "tato", email: "tpanchulidze@gmail.com}", password: "tato1234", password_confirmation: "tato1234")}
  subject { described_class.new(author: "tato", title: "new post", body: "this is new post", user_id: user.id)}

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end
  
  describe 'validations title' do
    it { should validate_presence_of(:title) }
  end

  describe 'validations body' do
    it { should validate_presence_of(:body) }
  end

  describe 'have many comments' do
    it { should have_many(:comments) }
  end
  
end

