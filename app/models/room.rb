class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user
  
  mount_uploader :icon, IconUploader

end
