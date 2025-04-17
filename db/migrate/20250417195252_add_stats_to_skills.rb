class AddStatsToSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :skills, :level, :integer
    add_column :skills, :damage_type, :string
    add_column :skills, :range, :string
    add_column :skills, :description, :string
  end
end
