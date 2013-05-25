class AddGunnerToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :gunner, :boolean
  end
end
