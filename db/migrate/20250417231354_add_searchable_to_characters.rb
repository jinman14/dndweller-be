class AddSearchableToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :searchable, :tsvector
  end
end
