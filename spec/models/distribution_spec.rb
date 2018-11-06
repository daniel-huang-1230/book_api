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

end
