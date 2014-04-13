require "test_helper"

#Given
feature "As an author or editor I want to approve comments so that
my blog does not have spam comments" do

  before do
    visit post_path(posts(:published))
    fill_in :comment_author,        with: "troll one"
    fill_in :comment_author_url,    with: "http://trollsite.example.com"
    fill_in :comment_author_email,  with: "troll@exampple.com"
    fill_in :comment_content,       with: "a bad comment"
    click_on "submit comment for approval"
  end


scenario "comments do not display until approved" do
    # given a published post (in fixtures)
    # when a site visitor comments (in before)
    # the comment is unapproved
    # and does not display on the blog
    visit post_path(posts(:published))
    page.wont_have_content "bad"
  end

scenario "editor can approve comments" do
    # given a pending comment (in before)
    # and I am signed in as an editor
    sign_in(:editor)

    # I can approve comments
    comment_id = Comment.last.id
    comment_row = "tr#comment_3{comment_id}"
    page.find(comment_row).click_on("Approve")

    # And the comments display on the blog
    # And the comments display on the index as approved
    visit comments_path
    page.find(comment_row).must_have_content "Approved"
end

scenario "Author can approve his own comments" do
  pending
end

scenario "unprivileged users/visitors cannot view comment approval page" do
  visit comments_path
  page.must_have_content "not authorized"
  end
end
