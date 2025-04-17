class CreateRaceStats < ActiveRecord::Migration[7.1]
  def change
    create_table :race_stats do |t|
      t.string :name
      t.integer :speed

      t.timestamps
    end
  end
end
