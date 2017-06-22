require 'test_helper'

class MessageNotificationMailerTest < ActionMailer::TestCase
  test "message_notify" do
    mail = MessageNotificationMailer.message_notify
    assert_equal "Message notify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
