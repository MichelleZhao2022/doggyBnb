# frozen_string_literal: true

class Accommodation < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :country, presence: true

  has_many_attached :images
end
