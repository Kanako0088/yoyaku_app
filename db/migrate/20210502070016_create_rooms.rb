class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :address
      t.string :content
      t.integer :price
      t.string :icon

      t.timestamps
    end
  end
end
