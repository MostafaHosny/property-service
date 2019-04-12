class PropertySearchService
  include ActiveModel::Validations

  attr_reader :lat, :lng, :property_type, :marketing_type

  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :property_type, inclusion: { in: %w[apartment single_family_house], message: 'is not a valid type' }
  validates :marketing_type, inclusion: { in: %w[rent sell], message: 'is not a valid type' }

  def initialize(params = {})
    @lat = params[:lat]
    @lng = params[:lng]
    @property_type = params[:property_type]
    @marketing_type = params[:marketing_type]
  end

  def properties
    @properties ||= Property.in_range(lat, lng).with_offer_type(marketing_type).with_property_type(property_type)
  end
end
