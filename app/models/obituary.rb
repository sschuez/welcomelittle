class Obituary < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  extend FriendlyId
  friendly_id :url_with_residence, :use => [:slugged, :history]

  has_rich_text :content


  def full_name
  	"#{first_name} #{last_name}"
  end

  def check_duplicate
  	full_names = []
  	obituaries = Obituary.all
		obituaries.each do |o|
			full_names << "#{o.first_name} #{o.last_name}"
		end
		full_names
		full_names.reverse.drop(1).reverse.include? self.full_name
  end

  def url_with_residence
  	if check_duplicate
  		"#{full_name} aus #{residence}"
  	else
  		full_name
  	end
  end

end
