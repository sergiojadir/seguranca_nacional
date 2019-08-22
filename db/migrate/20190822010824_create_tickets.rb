class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :passenger, foreign_key: true
      t.references :flight, foreign_key: true

      t.integer :seat_number

      t.timestamps
    end
  end
end
