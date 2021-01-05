class Trainer < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :password_digest, presence: true, uniqueness: true
  has_many :pokedexes
  has_many :pokemon
end