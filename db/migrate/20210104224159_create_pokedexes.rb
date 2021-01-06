class CreatePokedexes < ActiveRecord::Migration
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.integer :trainer_id
      t.timestamps null: false
    end
  end
end