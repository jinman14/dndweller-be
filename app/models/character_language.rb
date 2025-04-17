class CharacterLanguage < ApplicationRecord
    belongs_to :character
    belongs_to :equipment
end
