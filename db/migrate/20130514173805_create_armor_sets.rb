class CreateArmorSets < ActiveRecord::Migration
  def change
    create_table :armor_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
