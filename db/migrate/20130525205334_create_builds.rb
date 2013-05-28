class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :name
      t.string :description
      t.string :generated_description
      t.references :position_0
      t.references :position_1
      t.references :position_2
      t.references :position_3
      t.references :position_4
      t.references :position_5
      t.references :talisman

      t.timestamps
    end
    add_index :builds, :position_0_id
    add_index :builds, :position_1_id
    add_index :builds, :position_2_id
    add_index :builds, :position_3_id
    add_index :builds, :position_4_id
    add_index :builds, :position_5_id
    add_index :builds, :talisman_id
  end
end
