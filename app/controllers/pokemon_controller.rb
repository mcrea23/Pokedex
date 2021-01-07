class PokemonController < ApplicationController
  get "/" do
      erb :index 
    end

  get '/pokemon/new' do
    redirect to '/login' unless logged_in?
    erb :'pokemon/new'
  end

    post '/pokemon' do
      @pokemon = current_user.pokemon.build(params)
  end

  post '/pokemon/new' do
    @pokemon = Pokemon.find_by_id(params['pokemon'])
    @trainer = current_user
    @pokemon_trainer = PokemonTrainer.create(pokemon_id: @pokemon.id, trainer_id: @trainer.id)
    redirect '/index'
  end

  get '/pokemon' do
    "Hello World"
end
end