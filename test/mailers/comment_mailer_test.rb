require "test_helper"

describe CommentMailer do
  it "comment_confirmation" do
    mail = CommentMailer.comment_confirmation
    mail.subject.must_equal "Comment confirmation"
    mail.to.must_equal ["to@example.org"]
    mail.from.must_equal ["from@example.com"]
    mail.body.encoded.must_match "Hi"
  end
end
