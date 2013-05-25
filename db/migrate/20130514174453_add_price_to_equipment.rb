class AddPriceToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :price, :integer
  end
end
