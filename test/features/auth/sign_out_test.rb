require "test_helper"

feature ("as a visitor I want to destroy my session") do
  scenario "delete my existing sessions" do

    visit new_user_registration_path
    click_on "Sign out"

    page.must_have_content "Sign out"
    page.wont_have_content "You are logged in"
  end
end
