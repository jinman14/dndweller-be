# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end 
sample_user = User.create_or_find_by!(
  name: "The All Seer"
)

# sample_character = Character.create!(
#   user: sample_user,
#   name: "Jarisemosha",
#   level: 3,
#   race: "Human",
#   class_name: "Bard",
#   gender: "male",
#   token_url: "url here",
#   ac: 11,
#   hp: 20,
#   str: 10,
#   dex: 10,
#   con: 10,
#   int: 10,
#   wis: 10,
#   chr: 10
# )