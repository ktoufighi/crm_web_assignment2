require_relative 'contact'
require 'sinatra'

# Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')
# Contact.create('Marty', 'McFly', 'marty@mcfly.com', 'Teacher')
# Contact.create('George','McFly', 'george@mcfly.com', 'Nurse')
# Contact.create('Biff', 'Tannen', 'biff@tannen.com', 'Politician')
# Contact.create('Kathy', 'Toufighi', 'kathy@toufighi.com', 'Bitmaker student')

get '/' do
  @crm_app_name = "Kathy's CRM"
  erb :index
end

get '/about' do
  erb :home
end

get '/contact' do
  # contact = Contact.find(1000)
  erb :contact
end

get '/contact/contact_new' do
  erb :contact_new
end

get '/contact/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

delete '/contact/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to ('/contact')
  else
    raise Sinatra::NotFound
  end
end

get '/contact/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contact/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )
    redirect to('/contact')
  else
    raise Sinatra::NotFound
  end
end

post '/contact/' do
  @contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contact')
end


after do
  ActiveRecord::Base.connection.close
end
