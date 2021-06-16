class AddRuleReservation < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reservations, :start_date, null: false
    change_column_null :reservations, :end_date, null: false
    change_column_null :reservations, :num_people, null: false
  end
end
