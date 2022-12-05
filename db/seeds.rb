# frozen_string_literal: true

10.times do |_i|
  accommodation = Accommodation.create!(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    city: Faker::Address.city,
    country: 'New Zealand'
  )
end
