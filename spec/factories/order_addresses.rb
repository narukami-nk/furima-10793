FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture { 2 }
    municipality { '千歳市' }
    address_number { '1-1' }
    building { '北海道ハイツ' }
    telephon_number {'09012345678'}
  end
end
