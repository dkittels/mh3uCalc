class RemoveAliasFromTalisman < ActiveRecord::Migration
  def up
    remove_column :talismans, :alias
  end

  def down
    add_column :talismans, :alias, :string
  end
end
