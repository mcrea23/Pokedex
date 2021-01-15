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

  post '/login' do 
    user = Trainer.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/welcome'
    else
      redirect '/failure'
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end

  get "/failure" do
    erb :error
  end

  get '/pokemons' do
    @trainer = Trainer.find_by_id(session[:user_id])
    if logged_in?
    erb :'pokemon/pokemons'
    else
      redirect '/failure'
    end
  end

  get '/welcome' do
    @trainer = current_user
    if logged_in? 
      erb :'users/welcome'
    else
    redirect '/failure'
  end
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

  get "/trainer" do
    @trainer = current_user
    if logged_in? && @trainer.name == nil
      erb :'users/index'
    else
      redirect "/trainer/edit"
    end
  end
  
  post '/trainer' do
    @trainer = current_user
    @trainer.name = params[:name]
    @trainer.age = params[:age]
    @trainer.hometown = params[:hometown]
    @trainer.save
    redirect '/pokemons'
  end

  get '/trainer/edit' do
    @trainer = current_user
    if logged_in? && @trainer.name != nil
      erb :'users/edit'
    else
      redirect '/pokemons'
    end
  end

  patch '/trainer/edit' do
    @trainer = current_user
    @trainer.name = params[:name]
    @trainer.age = params[:age]
    @trainer.hometown = params[:hometown]
    @trainer.save
    redirect '/pokemons'
  end
end