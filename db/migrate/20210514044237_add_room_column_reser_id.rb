class AddRoomColumnReserId < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :reservation_id, :integer
  end
end
