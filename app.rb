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
    @booked_space = session[:booked_space]
    @spaces = Space.available
    erb :portal
  end

  post '/signup' do
    session[:first_name] = params[:first_name]
    redirect '/portal'
  end

  post '/book' do
    Space.book(params[:space])
    session[:booked_space] = params[:space]
    redirect '/portal'
  end

  run! if app_file == $0
end
