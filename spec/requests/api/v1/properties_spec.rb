require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :request do
  let(:json_response) { JSON.parse(response.body).with_indifferent_access }

  describe 'GET #index' do
    let!(:in_range1) { create(:property, lat: '52.5304903', lng: '13.3791152') }
    let!(:in_range2) { create(:property, lat: '52.5180764', lng: '13.47092') }

    context 'in range properties' do
      let(:valid_in_range_params) { { lat: '52.5329014', lng: '13.407021', marketing_type: 'sell', property_type: 'apartment' } }

      it 'returns nearby properties within range' do
        get api_v1_properties_path, params: valid_in_range_params

        expect(response).to have_http_status(:success)
        expect(json_response[:data].map { |property| property[:id].to_i }).to include(in_range1.id, in_range2.id)
      end
    end

    context 'out range properties' do
      let(:valid_out_range_params) { { lat: '34.55', lng: '10.66', marketing_type: 'sell', property_type: 'apartment' } }

      it 'returns message with no properties' do
        get api_v1_properties_path, params: valid_out_range_params

        expect(response).to have_http_status(:success)
        expect(json_response[:message]).to eq('No data for given location')
      end
    end

    context 'with not vaild params' do
      it 'returns errors if no location params' do
        get api_v1_properties_path, params: { marketing_type: 'sell', property_type: 'apartment' }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response[:errors][:lat]).to be_truthy
        expect(json_response[:errors][:lng]).to be_truthy
      end

      it 'returns errors message marketing_type not vaild' do
        get api_v1_properties_path, params: { lat: '34.55', lng: '10.66', marketing_type: 'wrong', property_type: 'fake' }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response[:errors][:marketing_type]).to be_truthy
        expect(json_response[:errors][:property_type]).to be_truthy
      end
    end
  end
end
