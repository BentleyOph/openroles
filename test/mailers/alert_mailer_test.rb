require "test_helper"

class AlertMailerTest < ActionMailer::TestCase
  test "new_jobs_found" do
    mail = AlertMailer.new_jobs_found
    assert_equal "New jobs found", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
