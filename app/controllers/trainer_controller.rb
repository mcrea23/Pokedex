class TrainerController < ApplicationController
  get '/signup' do 
    erb :'users/signup'
  end

  post '/signup' do
    @trainer = Trainer.create(username: params["username"], password: params["password"])
    session[:user_id] = @trainer.id
    redirect '/welcome'
  end

  get '/login' do
    erb :'users/login'
  end

  post "/login" do
    user = Trainer.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/welcome"
    else
      redirect "/"
    end
  end
  
  get '/logout' do
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

  get "/failure" do
    erb :failure
  end

  get '/pokemons' do
    erb :'pokemon/pokemons'
  end

  get '/welcome' do
    @trainer = current_user
    erb :'users/welcome'
  end

  get '/index' do
    @trainer = Trainer.find_by_id(session[:user_id])
    if logged_in?
    erb :index
    else
      redirect '/'
    end
  end

  post '/delete/:user_id' do
    Trainer.destroy(params[:user_id])
    redirect '/'
  end
end