require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space'

class McAirbnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/portal' do
    @spaces = Space.all
    @first_name = session[:first_name]
    erb :portal
  end

  post '/signup' do
    session[:first_name] = params[:first_name]
    redirect '/portal'
  end

  post '/book' do
  end

  run! if app_file == $0
end
