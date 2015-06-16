require 'sinatra'
require 'sinatra/reloader'


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end


get '/contacts' do
  @contacts = "contacts"
  erb :contacts
end