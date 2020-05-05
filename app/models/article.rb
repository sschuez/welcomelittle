class Article < ApplicationRecord
	has_rich_text :content

	validates :description, length: { maximum: 270 }
end
