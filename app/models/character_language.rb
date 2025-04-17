class CharacterLanguage < ApplicationRecord
    belongs_to :character
    belongs_to :language
end
