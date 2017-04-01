require 'sinatra'
require 'pg'
require 'ap'

require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/employees' do
employees_db = PG.connect(dbname:"tiy-database")
@employees = employees_db.exec("select * from employees")

  # in order to list the , we have to get them from the database...

  erb :employees
end

get '/show_info' do
  employees_db = PG.connect(dbname:"tiy-database")

  fuck = params["id"]

  @employees = employees_db.exec("select * from employees where id = $1", [fuck])

  erb :show_info
end
