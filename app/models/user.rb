class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :group, presence: true, length: { maximum: 5 }
  validates :password, presence: true, length: { maximum: 20 }
end
