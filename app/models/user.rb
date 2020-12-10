class User < ApplicationRecord
  has_many :reviews
  has_many :movies, through: :reviews
  
  has_secure_password

  validates :email, :username, presence: true, uniqueness: true
end
