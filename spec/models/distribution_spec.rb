require 'rails_helper'

# Test suite for the Distribution model
RSpec.describe Distribution, type: :model do
  # Association test
  # ensure Distribution model has belongs_to relationship with the Book and Shop models
  it { should belong_to(:book) }
  it { should belong_to(:shop) }
  # Validation tests for uniqueness
  describe 'validations' do
    it { should validate_uniqueness_of(:id).scoped_to([:book_id,:shop_id]) }
  end


  # method tests
  it "#update_copies_in_stock " do
    distribution = Distribution.create(
      copies_in_stock: 12
    )
    distribution.update_copies_in_stock(15)
    expect(distribution.copies_in_stock).to eq 0
  end

  it "#update_copies_in_stock " do
    distribution = Distribution.create(
      copies_in_stock: 5
    )
    distribution.update_copies_in_stock(3)
    expect(distribution.copies_in_stock).to eq 2
  end
end
