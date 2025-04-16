class AddTokenUrlToCharacter < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :token_url, :string
  end
end
