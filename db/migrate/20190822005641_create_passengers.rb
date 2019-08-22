class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.integer :national_id, unique: true
      t.string :gender

      t.timestamps
    end
  end
end
