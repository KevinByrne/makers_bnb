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

  get '/portal' do
    @first_name = session[:first_name]
    @bookings = session[:bookings]
    @spaces = Space.available
    erb :portal
  end

  post '/signup' do
    session[:first_name] = params[:first_name]
    redirect '/portal'
  end

  post '/book' do
    Space.book(params[:space])
    session[:bookings] = [] if session[:bookings] == nil
    session[:bookings] << params[:space]
    redirect '/portal'
  end

  post '/spaces/new' do
    Space.create(params[:space_name], params[:space_description], params[:price])
    redirect '/portal'
  end


  run! if app_file == $0
end
