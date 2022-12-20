# frozen_string_literal: true

class Accommodation < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :country, presence: true

  has_many_attached :images
  has_many :reservations, dependent: :destroy

  scope :city, ->(city) { where("lower(city) like ?", "%#{city.downcase}%")}
  enum :dog_size, [:small, :medium, :large]
  enum :room_type, [:single, :shared]
  enum :extra_care, [:daily_walk, :daily_play, :groom]

  def default_image
    images.first
  end

end
