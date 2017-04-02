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

  erb :employees
end

get '/show_info' do
  employees_db = PG.connect(dbname:"tiy-database")

  id = params["id"]

  @employees = employees_db.exec("select * from employees where id = $1", [id])

  erb :show_info
end

get '/add_employee' do
  addemployee_db = PG.connect(dbname: "tiy-database")

  name = params["name"]
  phone = params["phone"]
  address = params["address"]
  position = params["position"]
  salary = params["salary"]
  github = params["github"]
  slack = params["slack"]
  addemployee_db = PG.connect(dbname: "tiy-database")
  @employees = addemployee_db.exec("INSERT INTO employees(name, phone, address, position, salary, github, slack) VALUES($1, $2, $3, $4, $5, $6, $7)", [name, phone, address, position, salary, github, slack])




  erb :add_employee
# #

end
