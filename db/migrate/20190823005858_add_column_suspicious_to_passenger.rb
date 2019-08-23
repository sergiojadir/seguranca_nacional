class AddColumnSuspiciousToPassenger < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :suspicious, :boolean
  end
end
