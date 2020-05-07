class Article < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_rich_text :content

	validates :description, length: { maximum: 270 }
end
