
class UsersController < ApplicationController
  get '/signup' do 
    erb :signup
  end

  post '/signup' do
    @trainer = Trainer.create(username: params["username"], password: params["password"])
    session[:user_id] = @trainer.id
    redirect '/welcome'
  end

  get '/login' do
    erb :login
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  post '/login' do 
    user = Trainer.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/welcome'
    else
      redirect '/failure'
    end
  end