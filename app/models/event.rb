class Event < ApplicationRecord
	belongs_to :obituary
	has_one :user, through: :obituary

	has_rich_text :content 
end
