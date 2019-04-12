class PropertySerializer
  include FastJsonapi::ObjectSerializer

  attributes :house_number, :street, :city, :zip_code, :lat, :lng, :price
end
