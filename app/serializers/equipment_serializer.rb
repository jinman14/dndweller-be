class EquipmentSerializer
    def self.format_equipment(equipment)
        equipment["equipment_type"] == "weapon" ? format_weapon(equipment) : format_armor(equipment)
    end

    private

    def self.format_weapon(equipment)
        {
            data: {
                name: equipment.name,
                damage_dice: equipment.damage_dice,
                damage_type: equipment.damage_type,
                range: equipment.range.to_i
            }
        }
    end

    def self.format_armor(equipment)
        {
            data: {
                name: equipment.name,
                dex_bonus: equipment.dex_bonus,
                base_ac: equipment.base_ac.to_i
            }
        }
    end
end