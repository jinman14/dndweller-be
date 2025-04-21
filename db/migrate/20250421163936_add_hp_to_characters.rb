class AddHpToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :hp, :integer
  end
end
