class Job < ApplicationRecord
  has_many :apps
  has_many :users, through: :apps
end
