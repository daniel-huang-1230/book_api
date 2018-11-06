require 'rails_helper'

# Test suite for the Shop model
RSpec.describe Shop, type: :model do
  # Association test
  it { should have_many(:distributions).dependent(:destroy)}
  it { should have_many(:books).through(:distributions)}

end
