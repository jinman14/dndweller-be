class CreateCharacterEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :character_equipments do |t|
      t.references :character, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
