class AddRarityToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :rarity, :integer
  end
end
