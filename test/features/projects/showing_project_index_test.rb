require "test_helper"


feature "As the site visitor, I want ot see a developer's portfolio" do
  scenario "viewing all projects" do
    #Given a couple of projects (loaded from fixtures)
    project = Project.create(name: "How Meta", technologies_used: "Ruby, Rails, Zurb")


    #When I visit /projects
    visit projects_path

    #Then I should see a list of projects
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Ruby, Rails"
  end
end
