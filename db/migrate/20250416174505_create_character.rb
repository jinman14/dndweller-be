class CreateCharacter < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :str
      t.integer :dex
      t.integer :int
      t.integer :con
      t.integer :wis
      t.integer :chr
      t.string :name
      t.integer :ac
      t.integer :level
      t.string :race
      t.string :class_name
      t.string :gender

      t.timestamps
    end
  end
end
