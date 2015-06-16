require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  erb :index
  erb :contacts
end