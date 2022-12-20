class AddColumnsToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :dog_size, :integer, default: 0
    add_column :accommodations, :room_type, :integer, default: 0
    add_column :accommodations, :extra_care, :integer, default: 0
  end
end
