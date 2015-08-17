class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :number
      t.date :last_call
      t.date :last_attempt

      t.timestamps null: false
    end
  end
end
