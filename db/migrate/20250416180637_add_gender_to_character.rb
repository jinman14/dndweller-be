class AddGenderToCharacter < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :gender, :string
  end
end
