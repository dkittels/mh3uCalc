class CreateTalismansSkill < ActiveRecord::Migration
  def change
    create_table :talismans_skill do |t|
      t.references :talisman
      t.references :skill
      t.integer :value

      t.timestamps
    end
    add_index :talismans_skill, :talisman_id
    add_index :talismans_skill, :skill_id
  end
end
