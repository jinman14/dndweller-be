class AddSpeedToCharacter < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :speed, :integer
  end
end
