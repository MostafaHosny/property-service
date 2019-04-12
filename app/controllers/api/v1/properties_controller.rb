class Api::V1::PropertiesController < ApplicationController
  before_action :validate_search_params, on: :index

  def index
    if search_service.properties.present?
      render json: PropertySerializer.new(search_service.properties)
    else
      render json: { message: 'No data for given location' }
    end
  end

private

  def search_service
    @search_service ||= PropertySearchService.new(params)
  end

  def validate_search_params
    return if search_service.valid?

    render json: { errors: search_service.errors.messages }, status: :unprocessable_entity
  end
end
