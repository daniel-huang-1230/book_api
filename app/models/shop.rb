class Shop < ApplicationRecord
  has_many :books, :through => :distributions

  def update_sold_count copies_sold
    self.books_sold_count += copies_sold
    self.save
  end
end
