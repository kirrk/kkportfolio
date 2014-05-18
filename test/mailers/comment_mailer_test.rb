require "test_helper"

describe CommentMailer do
  it "comment_confirmation" do
    mail = CommentMailer.comment_new
    mail.subject.must_equal "New comment on portfolio'"
    mail.to.must_equal ["kkirr77@yahoo.com"]
    mail.from.must_equal ["kkirr77@yahoo.com"]
    mail.body.encoded.must_match "Hi"
  end
end
