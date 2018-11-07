require 'rails_helper'

RSpec.describe 'Shops API', type: :request do

   # Test suite for PATCH API -- update_as_sold

   # Initialize the test data

  describe 'PATCH /api/v1/shops/:id/books/:book_id' do
    before { patch "/api/v1/shops/1/books/1" }

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
        expect(response.body).to match(/cannot find the book in this shop/)
      end
    end
  end

end
