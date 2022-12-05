# frozen_string_literal: true

10.times do |i|
  accommodation = Accommodation.create!(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    city: Faker::Address.city,
    country: 'New Zealand'
  )

  accommodation.images.attach(io: File.open(Rails.root.join('db', 'sample', 'images', "accommodation_#{i + 1}.png")),
  filename: accommodation.name)
end
