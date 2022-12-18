class AddUniqueIndexToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, [:accommodation_id, :reservation_date], unique: true
  end
end
