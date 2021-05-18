class RemoveUserId < ActiveRecord::Migration[6.1]
  def up
    remove_column :rooms, :user_id
  end
  
  def down
    add_column :rooms, :user_id, :integer
  end
end
