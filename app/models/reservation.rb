class Reservation < ApplicationRecord
  belongs_to :accommodation

  validates :reservation_date, presence: true 
end
