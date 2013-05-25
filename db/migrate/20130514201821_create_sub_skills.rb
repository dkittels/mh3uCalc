class CreateSubSkills < ActiveRecord::Migration
  def change
    create_table :sub_skills do |t|
      t.string :name
      t.references :skill
      t.references :parent_sub_skill
      t.integer :skill_value

      t.timestamps
    end
    add_index :sub_skills, :skill_id
  end
end
