FactoryBot.define do
  factory :property do
    offer_type { 'sell' }
    property_type { 'apartment' }
    zip_code { '10179' }
    city { 'Berlin' }
    street { 'Michaelkirchplatz' }
    house_number { 45 }
    lng { 52.5069238 }
    lat { 13.4201547 }
    construction_year { 1997 }
    number_of_rooms { 23 }
    currency { 'eur' }
    price { 30_000 }
  end
end
