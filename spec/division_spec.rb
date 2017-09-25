require('spec_helper')


describe(Division) do
  describe("#projects") do
    it("tells which projects are in it") do
      test_division = Division.create({:name => "division"})
      division_project1 = Project.create({:description => "project1", :division_id => test_division.id})
      division_project2 = Project.create({:description => "project2", :division_id => test_division.id})
     expect(test_division.projects()).to(eq([division_project1, division_project2]))
    end
  end
end
