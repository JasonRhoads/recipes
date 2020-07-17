require 'sinatra'
require './recipes'

get '/' do
  @title = "Home"
  erb :index
end

get '/recipes' do
  @title = "Recipes"
  erb :recipes
end

get '/about' do
  @title = "About"
  erb :about
end

post '/get_recipe' do
  @recipe = params[:recipe]
  erb :result
end