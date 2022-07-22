require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space'

class MakersBnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/spaces' do
    @first_name = session[:first_name]
    @spaces = Space.available
    erb :spaces
  end

  post '/signup' do
    session[:first_name] = params[:first_name]
    redirect '/spaces'
  end

  post '/book' do
    Space.book(params[:space])
    session[:bookings] = [] if session[:bookings] == nil
    session[:bookings] << params[:space]
    redirect '/confirmation'
  end

  post '/spaces/new' do
    Space.create(params[:space_name], params[:space_description], params[:price])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new
  end

  get '/confirmation' do
    @bookings = session[:bookings]
    erb :confirmation
  end

  run! if app_file == $0
end
