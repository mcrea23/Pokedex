class CreatePokedexes < ActiveRecord::Migration
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end