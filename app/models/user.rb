class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reservations
  has_many :users
  
  def reservations
    return Reservation.where(user_id: self.id)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
