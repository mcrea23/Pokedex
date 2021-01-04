class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :age
      t.string :hometown
      t.string :username
      t.string :password_digest
      t.timestamps null: false
    end
  end
end