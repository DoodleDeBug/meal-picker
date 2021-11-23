# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class MealPicker < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
