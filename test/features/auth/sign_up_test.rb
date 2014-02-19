require "test_helper"

feature ("As a site visitor  I want to be able to sign up for an account so that
  I can perform actions that require me to be logged in") do

scenario "sign up" do

  #Given a registration form
  visit new_user_registration_path
  click_on "Sign up"

  #Wen I register with valid info
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_on "Sign up"

  #Then I should be signed up
  page.must_have_content "Welcome aboard"
  page.wont_have_content "There was a problem with your sign up"
  end
end
