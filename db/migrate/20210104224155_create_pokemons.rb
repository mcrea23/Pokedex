class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :pokemon_type
      t.string :region
      t.string :sprite
      t.string :height
      t.integer :trainer_id
      t.integer :pokemon_id
      t.timestamps null: false
    end
  end
end