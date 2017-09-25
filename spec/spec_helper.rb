ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("project")
require('employee')
require('division')

RSpec.configure do |config|
  config.after(:each) do
    Division.all().each() do |division|
      division.destroy()
    end
    Project.all().each() do |project|
      project.destroy()
    end
    Employee.all().each() do |employee|
      employee.destroy()
    end
  end
end
