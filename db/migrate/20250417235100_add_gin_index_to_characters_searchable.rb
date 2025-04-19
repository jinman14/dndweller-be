class AddGinIndexToCharactersSearchable < ActiveRecord::Migration[7.1]
  def change
    add_index :characters, :searchable, using: :gin
  end
end
