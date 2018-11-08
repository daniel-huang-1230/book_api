require 'rails_helper'

RSpec.describe 'Shops API', type: :request do

   # Test suite for PATCH API -- update_as_sold

   # Initialize the test data
  describe 'PATCH /api/v1/shops/:id/books/:book_id' do
    distribution = Distribution.first

    before { patch "/api/v1/shops/#{distribution.shop_id}/books/#{distribution.book_id}" }

    context 'when the record exists' do
      it 'returns the shops' do
        expect(json).not_to be_empty

      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:shop_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/cannot find /)
      end
    end
  end

end
