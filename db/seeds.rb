# frozen_string_literal: true

10.times do |i|
  accommodation = Accommodation.create!(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    city: Faker::Address.city,
    country: 'New Zealand',
    price_cents: Money.from_amount((1..100).to_a.sample)
  )

  3.times do |x|
  accommodation.images.attach(io: File.open(Rails.root.join('db', 'sample', 'images', "accommodation_#{i + 1 + x}.png")),
                              filename: accommodation.name)
  end
end
