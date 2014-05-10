require "test_helper"

#Given
feature "As a site visitor I want to write a comment from a blog post page so that I can troll the author" do
scenario "adding a comment" do

#when
visit posts_path

#then
fill_in "Comment", with: comments(:content)
click_on "Create Comment"
end

#Given a valid comment is entered
scenario "As an author or editor I want to approve comments so that my blog does not have spam comments" do
sign_in(":author")

#when a form is submitted with a short name and missing
#technologies_used field
check "Approved"

#Then the form should be displayed again, with an error messge
page.text.must_include "Post was successfully updated"
    end
end
