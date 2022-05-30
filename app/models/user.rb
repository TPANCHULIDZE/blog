class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, presence: true
end
