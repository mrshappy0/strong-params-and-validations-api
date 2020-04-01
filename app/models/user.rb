class User < ApplicationRecord
  has_secure_password

  validates :name, :username, :email, :password, presence: true
  validates :username, length: { minimum: 6, maximum: 12, message: "%{attribute} must be between 6 and 12 characters long." }
  validates :username, uniqueness: {message: "%{attribute}s must be unique, and %{value} has already been taken."}
end
