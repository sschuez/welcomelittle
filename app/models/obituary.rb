class Obituary < ApplicationRecord
  belongs_to :user

  extend FriendlyId
  friendly_id :full_name, :use => [:slugged, :history]

  has_rich_text :content

  def full_name
  	"#{first_name} #{last_name}"
  end
end
