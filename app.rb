require 'sinatra'
require_relative 'config/application'
enable :sessions

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
  end
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/' do
  redirect '/meetups'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/create' do
  erb :'meetups/create'
end

get '/meetups/:id' do
  if authenticate!
  else
    info = Meetup.where(name: params[:id])[0]
    @id          = info.id
    @name        = info.name
    @description = info.description
    @location    = info.location
    creator_id   = Attendance.find_by(creator: true, meetup_id: @id).user_id
    @creator     = User.find_by(id: creator_id).username
    @attendees   = Attendance.where(meetup: @id)
  end
  erb :'meetups/show'
end

post '/meetups' do
  name        = params[:name]
  location    = params[:location]
  description = params[:description]

  @name        = name
  @location    = location
  @description = description

  if authenticate!
    erb :'meetups/create'
  elsif name.empty? || location.empty? || description.empty?
    flash[:notice] = "Please Fill All Fields!"
    erb :'meetups/create'
  else
    new_meetup = Meetup.create(name: name, location: location, description: description)
    Attendance.create(user_id: current_user.id, meetup_id: new_meetup.id, creator: true)
    redirect to('/')
  end

end

post '/meetups/:id' do
  name = params[:id]
  meetup_id = Meetup.find_by(name: name).id
  @meetup = Meetup.find(meetup_id)

  if authenticate!
  elsif Attendance.find_by(meetup_id: @meetup.id, user_id: current_user.id).nil?
    flash[:notice] = "You have joined this Meetup!"
    Attendance.create(meetup_id: @meetup.id, user_id: current_user.id, creator: false)

  else
    flash[:notice] = "You've already joined that Meetup!"
    erb :'meetups/create'
  end

  redirect to("/meetups")
end
