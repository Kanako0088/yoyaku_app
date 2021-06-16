class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :string
    add_column :users, :image, :string
  end
end
