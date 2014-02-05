require "test_helper"

feature "Editing a Post" do
  scenario "Edit a form's data" do

    #Given an exiting post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)

    #When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"


    #Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"

  end
end
