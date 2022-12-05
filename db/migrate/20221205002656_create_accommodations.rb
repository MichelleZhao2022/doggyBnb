# frozen_string_literal: true

class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :country
      t.integer :reviews_count
      t.decimal :average_rating

      t.timestamps
    end
  end
end
