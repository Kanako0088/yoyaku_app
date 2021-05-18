class AddColumnRoomId < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_id, :integer
  end
end
