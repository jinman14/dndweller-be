class CreateCharacterLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :character_languages do |t|
      t.references :character, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
