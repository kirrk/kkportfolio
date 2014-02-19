require "test_helper"
        #current_user.posts << @post

feature "Creating a Post" do
  scenario "submit form data to create a new post" do

    #Given a new post form is completed
    visit new_user_session_path
    fill_in "Email", with: users(:UserPerson).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body


    #When I submit a form
    click_on "Create Post"



    #Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
    page.has_css?('right-label')
    page.has_css? "#author"
    page.text.must_include users(:UserPerson).email



  end
end
