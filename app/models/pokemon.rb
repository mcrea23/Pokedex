class Pokemon < ActiveRecord::Base
  belongs_to :pokedexes
  has_many :trainers, through: :pokemon_trainers
end