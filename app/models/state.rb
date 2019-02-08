class State < ApplicationRecord
  has_many :users
  has_many :emotions, through: :users
end
