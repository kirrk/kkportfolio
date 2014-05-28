class CommentMailer < ActionMailer::Base
  default from: "kkirr77@yahoo.com"

  def comment_new (comment, commentable)
  @comment = comment
  @commentable = commentable
    mail to:  'kkirr77@yahoo.com',
         subject: 'New comment on portfolio'
  end
end
