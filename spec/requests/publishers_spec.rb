require 'rails_helper'

RSpec.describe 'Publishers API', type: :request do

   # Test suite for GET API -- retrieve_shops

   # Initialize the test data
  let(:publisher) { create(:publisher)}
  let(:publisher_id) { publisher.id}
  describe 'GET /api/v1/publishers/:id' do

    before { get "/api/v1/publishers/#{publisher_id}" }

    context 'when the record exists' do
      it 'returns the shops' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:publisher_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Publisher/)
      end
    end
  end

end
