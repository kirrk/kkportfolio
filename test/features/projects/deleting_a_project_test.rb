require "test_helper"
    feature "As the site owner, I want to delete a project" do
        scenario "delete an existing project" do

    #Given an existing project
    visit posts_path

    #When I want to delete a project
    click_on "Destroy"

    #Then the projects should be deleted
    page.text.must_include "Deleted"

    end
end
