class CreateSuspiciousPassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :suspicious_passengers do |t|
      t.references :passenger, foreign_key: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
