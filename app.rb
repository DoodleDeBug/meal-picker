# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/meal.rb'

class MealPicker < Sinatra::Base
  configure :development, :test do
    enable :sessions
    register Sinatra::Reloader
  end

  get '/' do
    if session[:type]
      @meal_suggestion = Meal.random(session[:type]).name
    end
    erb :index
  end

  post '/' do
    session[:type] = params[:category]

    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
