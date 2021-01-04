class Pokemon < ActiveRecord::Base
  belongs_to :pokedexes
  belongs_to :trainers
end