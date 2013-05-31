class AddUserIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :user_id, :integer
    add_index :builds, :user_id
  end
end
