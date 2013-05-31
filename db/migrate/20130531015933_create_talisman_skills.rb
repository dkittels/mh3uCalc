class CreateTalismanSkills < ActiveRecord::Migration
  def change
    create_table :talisman_skills do |t|
      t.references :talisman
      t.references :skill
      t.integer :value

      t.timestamps
    end
    add_index :talisman_skills, :talisman_id
    add_index :talisman_skills, :skill_id
  end
end
