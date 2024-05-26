class User < ApplicationRecord
  has_secure_password  # This assumes you're using bcrypt for password hashing
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
