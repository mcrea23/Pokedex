class CreatePokemonTrainers < ActiveRecord::Migration
  def change
    create_table :pokemon_trainers do |t|
      t.integer :pokemon_id
      t.integer :trainer_id
      t.string :nickname

      t.timestamps null: false
    end
  end
end
