# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inquiry_mailer/inquiry_confirmation
  def inquiry_confirmation
    inquiry = Inquiry.first
    # This is how you pass value to params[:user] inside mailer definition!
    InquiryMailer.with(inquiry: inquiry).inquiry_confirmation
  end
  
end