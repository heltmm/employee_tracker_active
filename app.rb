require('sinatra/activerecord')
require 'sinatra'
require 'pry'
require 'sinatra/reloader'
also_reload '.lib/**/*.rb'
require './lib/project'
require './lib/employee'
require './lib/division'
require 'pg'

get('/') do
  @employees = Employee.all
  @divisions = Division.all
  @projects = Project.all
  @division = false
  @employee = false
  @project = false
  erb(:index)
end

post('/division') do
  Division.create(:name => params['name'])
  redirect ('/')
end

post('/project') do
  Division.find(params['division_id']).projects.create(:name => params['name'], :description => params['description'], :done => false)
  redirect ('/')
end

post('/employee') do
  Employee.create(:name => params['name'], :project_id => nil)
  redirect ('/')
end

get('/project/:id') do
  @employees = Employee.all
  @divisions = Division.all
  @projects = Project.all
  @project = Project.find(params[:id])
  erb(:index)
end

get('/division/:id') do
  @employees = Employee.all
  @divisions = Division.all
  @projects = Project.all
  @division = Division.find(params[:id])
  erb(:index)
end

get('/employee/:id') do
  @employees = Employee.all
  @divisions = Division.all
  @projects = Project.all
  @employee = Employee.find(params[:id])
  erb(:index)
end

post('/employee/:id') do
  Employee.find(params['id']).update( :project_id => params['project_id'])
  redirect ('/')
end

delete('/division/delete/:id') do
  Division.delete(Division.find(params[:id]))
  redirect('/')
end

delete('/employee/delete/:id') do
  Employee.delete(Employee.find(params[:id]))
  redirect('/')
end

delete('/project/delete/:id') do
  Project.delete(Project.find(params[:id]))
  redirect('/')
end
