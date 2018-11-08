class Distribution < ApplicationRecord
  # join model for shops and books --> many-to-many relationship
  belongs_to :shop
  belongs_to :book

  validates :book_id, uniqueness: { scope: :shop_id }
  # method that updates the number of copies of a particular book in stock of the shop
  def update_copies_in_stock copies_sold
    actual_sold = [copies_sold, self.copies_in_stock].min
    self.copies_in_stock -= actual_sold
    self.save
    actual_sold # return the actual number of copies sold
  end

end
