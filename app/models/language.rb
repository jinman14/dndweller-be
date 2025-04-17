class Language < ApplicationRecord
    has_many :character_languages
    has_many :characters, through: :character_languages
end