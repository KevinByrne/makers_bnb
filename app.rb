require 'sinatra/base'
require 'sinatra/reloader'

class McAirbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'This is our landing page.'
  end

  get '/portal' do
  end

  post '/sign-up' do
  end

  post '/book' do
  end

  run! if app_file == $0
end
