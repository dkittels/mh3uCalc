class CreateArmorSkills < ActiveRecord::Migration
  def change
    create_table :armor_skills do |t|
      t.references :equipment
      t.references :skill
      t.integer :value

      t.timestamps
    end
    add_index :armor_skills, :equipment_id
    add_index :armor_skills, :skill_id
  end
end
