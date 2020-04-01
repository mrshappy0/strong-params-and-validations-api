class User < ApplicationRecord
  has_secure_password

  validates :name, :username, :email, presence: true
  validates :username, length: { minimum: 6, maximum: 12 }
  validates :username, uniqueness: true
end
