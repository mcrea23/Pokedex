class Pokedex < ActiveRecord::Base
  belongs_to :trainer
  has_many :pokemons
end