require("spec_helper")

describe(Project) do

  describe(".not_done") do
    it("returns the not done projects") do
      not_done_project1 = Project.create({:description => "gotta do it", :done => false})
      not_done_project2 = Project.create({:description => "gotta do it too", :done => false})
      not_done_projects = [not_done_project1, not_done_project2]
      done_project = Project.create({:description => "done project", :done => true})
      expect(Project.not_done()).to(eq(not_done_projects))
    end
  end
end
