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

scenario "sign in with twitter works" do
   visit root_path
   click_on "Sign In"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                      {
                        uid: '12345',
                        info: { nickname: 'test_twitter_user'},
                      })
   click_on "Sign in with Twitter"
   save_and_open_page
   page.must_have_content "test_twitter_user, you are signed in!"
  end
end
