require_relative 'contact'
require 'sinatra'

Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')

get '/' do
  @crm_app_name = "Kathy's CRM"
  @server_time = Time.now
  erb :index
end

get '/home' do
  erb :home
end

get '/contact' do
  contact = Contact.find(1000)
  erb :contact
end

get '/contact/1' do
  @contact = Contact.find(1)
  erb :show_contact
end

get '/about' do
  erb :about
end

get '/add_contact' do
  erb :add_contact
end

get '/update' do
  erb :new_contact
end

get '/delete' do
  erb :delete
end

get '/edit' do
  erb :edit
end

# post '/contact' do
#   Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
#   redirect to ('/contacts')
# end
