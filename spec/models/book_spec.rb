require 'rails_helper'

# Test suite for the Book model
RSpec.describe Book, type: :model do
  # Association test
  it { should belong_to(:publisher)}
  it { should have_many(:distributions).dependent(:destroy)}
  it { should have_many(:shops).through(:distributions)}

end
