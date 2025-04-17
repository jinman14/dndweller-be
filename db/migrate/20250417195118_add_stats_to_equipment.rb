class AddStatsToEquipment < ActiveRecord::Migration[7.1]
  def change
    add_column :equipment, :type, :string
    add_column :equipment, :damage_dice, :string
    add_column :equipment, :damage_type, :string
    add_column :equipment, :range, :string
    add_column :equipment, :dex_bonus, :boolean
    add_column :equipment, :base_ac, :integer
  end
end
