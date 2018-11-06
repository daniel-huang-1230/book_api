class Distribution < ApplicationRecord
  # join model for shops and books --> many-to-many relationship
  belongs_to :shop
  belongs_to :book

  validates :shop, uniqueness: { scope: :book } 
  # method that updates the number of copies of a particular book in stock of the shop
  def update_copies_in_stock copies_sold
    self.copies_in_stock -= [copies_sold, self.copies_in_stock].min
  end

end
