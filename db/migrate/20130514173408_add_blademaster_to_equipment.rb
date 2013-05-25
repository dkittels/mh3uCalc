class AddBlademasterToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :blademaster, :boolean
  end
end
