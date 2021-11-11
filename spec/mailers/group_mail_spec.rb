require "rails_helper"

RSpec.describe GroupMailMailer, type: :mailer do
  test "send announcement email" do
    # Set up an announcement based on the fixture
    announcement = announcements(:one)

    # Set up an email using the announcement contents
    email = GroupMailMailer.with(announcement: announcement).email_layout

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal [<ADMIN_EMAIL>], email.from
    assert_equal [<ADMIN_EMAIL>], email.to
    assert_equal announcement.title, email.subject
    assert_match announcement.title, email.html_part.body.encoded
    assert_match announcement.title, email.text_part.body.encoded
    assert_match announcement.author, email.html_part.body.encoded
    assert_match announcement.author, email.text_part.body.encoded
    assert_match announcement.description, email.html_part.body.encoded
    assert_match announcement.description, email.text_part.body.encoded
    assert_match announcement.date, email.html_part.body.encoded
    assert_match announcement.date, email.text_part.body.encoded
    assert_match announcement.message, email.html_part.body.encoded
    assert_match announcement.message, email.text_part.body.encoded
  end
end