require 'sinatra/base'
require 'sinatra/reloader'

class MealPicker < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end
