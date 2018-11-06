require 'rails_helper'

# Test suite for the Publisher model
RSpec.describe Publisher, type: :model do
  # Association test
  # ensure Publisher model has_many relationship with the Book
  it { should have_many(:books) }

end
