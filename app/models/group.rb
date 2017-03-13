class Group < ApplicationRecord
  has_many :users, through: :users_groups
end
