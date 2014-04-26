require "test_helper"

feature "as a visitor I want to destroy my session so that my session is closed" do
  scenario "sign out current user" do

    visit new_user_session_path
    #given current user
    fill_in "Email", with: users(:UserPerson).email
    fill_in "Password", with: "password"
    sign_in(:editor)

    page.must_have_content "Signed in successfully."
    page.must_have_content "Sign out"

     #when sign out is clicked
    find_link("Sign out").visible?
    find_link("Sign out").click

     #then the session should be destroyed
    page.must_have_content "Signed out successfully."
    page.wont_have_content "You are logged in"
  end
end
