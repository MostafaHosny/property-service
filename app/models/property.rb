class Property < ApplicationRecord
  acts_as_geolocated
  DEFAULT_RANGE = 5000
  #-----------scopes----------------
  scope :with_offer_type, ->(offer_type) { where(offer_type: offer_type) if offer_type.present? }
  scope :with_property_type, ->(property_type) { where(property_type: property_type) if property_type.present? }
  scope :in_range, ->(lat, lng) { within_radius(DEFAULT_RANGE, lat, lng) if lat.present? && lng.present? }
end
