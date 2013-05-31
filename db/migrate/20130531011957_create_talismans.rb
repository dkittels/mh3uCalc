class CreateTalismans < ActiveRecord::Migration
  def change
    create_table :talismans do |t|
      t.string :name
      t.string :alias
      t.references :user
      t.integer :rarity
      t.integer :slots

      t.timestamps
    end
    add_index :talismans, :user_id
  end
end
