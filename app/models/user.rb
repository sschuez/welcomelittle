class User < ApplicationRecord
  after_create :send_welcome_email
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         # :confirmable
  
  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

end
