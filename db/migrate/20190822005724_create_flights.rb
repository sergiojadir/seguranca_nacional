class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number, unique: true
      t.integer :origin_id
      t.integer :destination_id
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
