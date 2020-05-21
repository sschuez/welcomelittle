class User < ApplicationRecord
  after_create :send_welcome_email

  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         # :confirmable

  has_many :obituaries
  has_one_attached :photo
  has_many :memories, through: :obituaries

  validates :first_name, :last_name, presence: true

  # mount_uploader :photo, AvatarUploader
  
  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

end
