class Event < ApplicationRecord
	belongs_to :obituary
	has_one :user, through: :obituary

	has_rich_text :content

	geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
end
