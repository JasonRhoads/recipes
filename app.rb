require 'sinatra'
require './recipes'
require './database/database'

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

get '/log_in' do
  @title = "Log in"
  erb :login
end

post '/log_in' do
  @title = "Log in"
  @user = params[:email]
  erb :profile
end

get '/sign_up' do
  @title = "Sign Up"
  erb :signup
end

post '/sign_up' do
  @title = "Log in"
  @user = { email: params[:email].downcase, first_name: params[:first_name], 
            last_name: params[:last_name], password: params[:password],
            password_confirmation: params[:password_confirmation] }
  Database.add_user(@user)
  erb :profile
end

post '/get_recipe' do
  @title = "Recipes"
  @recipe_url = params[:recipe_url]
  erb :result
end