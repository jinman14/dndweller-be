class FixEquipmentColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :equipment, :type, :equipment_type
  end
end
