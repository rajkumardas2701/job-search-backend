class User < ApplicationRecord
  has_secure_password
  has_many :apps
  has_many :jobs, through: :apps

  validates :email, presence: true, uniqueness: true
end
