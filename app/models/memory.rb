class Memory < ApplicationRecord
  belongs_to :obituary
  has_one :user, through: :obituary
end
