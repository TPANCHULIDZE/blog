require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(username: "tato", email: "tpanchulidze@gmail.com}", password: "tato1234", password_confirmation: "tato1234")}

    describe 'have many posts' do
      it { should have_many(:posts) }
    end

    describe 'have many comments' do
      it { should have_many(:comments) }
    end

    describe 'validations username' do
      it { should validate_presence_of(:username) }
      it { should validate_uniqueness_of(:username) }
    end

    describe 'have secure password' do
      it { should have_secure_password }
    end

    describe 'validations email' do
      it { should validate_presence_of(:email) }
    end

    describe 'validations password' do
      it { should validate_presence_of(:password) }
      it { should validate_confirmation_of(:password) }
    end
end

