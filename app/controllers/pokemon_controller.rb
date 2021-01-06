class PokemonController < ApplicationController
  get "/" do
    if Pokemon.all.size == 0
      Api.new.pokemon_creator 
    else
      erb :index 
    end

#   get '/pokemon' do
#     redirect to '/login' unless logged_in?
#     @pokemon = Pokemon.all
#     erb :'pokemon/index'
#   end

#   get '/pokemon/new' do
#     redirect to '/login' unless logged_in?
#     erb :'pokemon/new'
#   end
# end
end
end