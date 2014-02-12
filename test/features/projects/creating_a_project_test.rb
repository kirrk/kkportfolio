require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I
can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: projects(:portfolio).name
    fill_in "Technologies used", with: projects(:portfolio).technologies_used
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end

#Given invalid project data is entered in a form
scenario "new project has invalid data" do
    visit new_project_path
        fill_in "Name", with: "Q"


#when a form is submitted with a short name and missing
#technologies_used field
click_on "Create Project"

#Then the form should be displayed again, with an error messge
current_path.must_match /projects$/
page.text.must_include "Project could not be saved"
page.text.must_include "Name is too short"
page.text.must_include "Technologies used can't be blank"


    end
end
