require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = InquiryMailer.inquiry_confirmation
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end


# localhost:3000/rails/mailers/inquiry_mailer/inquiry_confirmation
