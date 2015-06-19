require_relative 'rolodex'
require_relative 'contact'

require 'sinatra'
require 'sinatra/reloader'


@@rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

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


get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

post "/contacts" do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  @@rolodex.add_contact(new_contact)
  redirect to("/contacts")
end



put '/contacts/:id' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.update(params[:first_name], params[:last_name], params[:email], params[:notes])
    redirect to("/contacts/#{@contact.id}")
  else
    raise Sinatra::NotFound
  end
end


