class Reservation < ApplicationRecord
  belongs_to :room, primary_key: :id, foreign_key: :room_id
  belongs_to :user
  
  with_options presence: true do
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :num_people, presence: true
  end
  
  def total_amount
    s = start_date.strftime("%Y,%m,%d").to_i
    e = end_date.strftime("%Y,%m,%d").to_i
    use_days = (Date.new(e) - Date.new(s)).denominator + 2
    
    price * num_people * use_days
  end
  
  def total_amount
    {:total_amount => total_amount}
  end
end
