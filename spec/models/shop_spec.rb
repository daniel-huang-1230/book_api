require 'rails_helper'

# Test suite for the Shop model
RSpec.describe Shop, type: :model do
  # Association test
  it { should have_many(:distributions).dependent(:destroy)}
  it { should have_many(:books).through(:distributions)}

  # method tests
  it "#update_sold_count" do
    shop = Shop.create(
      :books_sold_count => 5
    )
    shop.update_sold_count(1)
    expect(shop.books_sold_count).to eq 6
  end
end
