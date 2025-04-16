class CreateCharacterSkill < ActiveRecord::Migration[7.1]
  def change
    create_table :character_skills do |t|
      t.references :character, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
