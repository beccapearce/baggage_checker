class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :group, presence: true, length: { maximum: 5 }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
