class AddReservationsUserIdAndRemoveRoomUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :user_id, :integer
  end
  
  def up
    remove_column :rooms, :user_id
  end

  def down
    add_column :rooms, :user_id, :integer
  end
end
