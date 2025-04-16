class Equipment < ApplicationRecord
    has_many :character_equipments
    has_many :characters, through: :character_equipments
end