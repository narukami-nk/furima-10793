FactoryBot.define do
  factory :item do
    item_name              { Faker::Name.name }
    item_text              { Faker::Lorem.sentence }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id            { 2 }
    condition_id           { 2 }
    delivery_type_id       { 2 }
    prefecture_id          { 2 }
    shipping_period_id     { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end
