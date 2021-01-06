class PokemonController < ApplicationController
  get "/" do
    if Pokemon.all.size == 0
      Api.new.pokemon_creator 
    else
      erb :index 
    end
  end 
end