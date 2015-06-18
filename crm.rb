require_relative 'rolodex'
require_relative 'contact'

require 'sinatra'
require 'sinatra/reloader'

$rolodex = Rolodex.new
$rolodex.add_contact(Contact.new("John", "Doe", "johnD@gmail.com", "Awesome"))


get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contact/1' do
  @contact = @@rolodex.find(1)
  erb :show_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

