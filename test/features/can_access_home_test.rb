require "test_helper"

feature "Can access homepage" do
  scenario "there is a title there" do
    visit root_path
    page.must_have_content "Welcome"
    page.wont_have_content "Goobye All!"
  end
end
