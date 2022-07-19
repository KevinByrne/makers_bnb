require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space'

class McAirbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'This is our landing page.'
  end

  get '/portal' do
    @spaces = Space.all
    erb :portal
  end

  post '/sign-up' do
  end

  post '/book' do
  end

  run! if app_file == $0
end
