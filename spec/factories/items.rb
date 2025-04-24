FactoryBot.define do
  factory :item do
    title                  { Faker::Commerce.product_name }
    content                { Faker::Lorem.paragraph(sentence_count: 2) }
    category_id            { rand(2..12) }
    condition_id           { rand(2..7) }
    shipping_fee_burden_id { rand(2..3) }
    prefecture_id          { rand(2..48) }
    shipping_day_id        { rand(2..4) }
    price                  { rand(300..999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end