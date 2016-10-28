require 'sinatra'

get '/' do
  @crm_app_name = "Kathy's CRM"
  @server_time = Time.now
  erb :index
end

get '/home' do
  erb :home
end

get '/contact' do
  erb :contact
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

# post '/contact' do
#   Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
#   redirect to ('/contacts')
# end
