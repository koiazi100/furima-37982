FactoryBot.define do
  factory :item do
    title              { 'test' }
    explanation        { 'test' }
    category_id        { '2' }
    fee_burden_id      { '2' }
    ship_area_id       { '2' }
    ship_day_id        { '2' }
    status_id          { '2' }
    price              { '1000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
