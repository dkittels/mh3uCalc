class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :position
      t.integer :slots
      t.references :armor_set
      t.integer :fire_res
      t.integer :water_res
      t.integer :thunder_res
      t.integer :ice_res
      t.integer :dragon_res
      t.integer :max_defense
      t.boolean :in_game

      t.timestamps
    end
    add_index :equipment, :armor_set_id
  end
end
