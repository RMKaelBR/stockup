class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
