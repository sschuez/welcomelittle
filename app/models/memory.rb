class Memory < ApplicationRecord
  belongs_to :obituary
  belongs_to :user

  has_rich_text :content
end
