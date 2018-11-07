class Publisher < ApplicationRecord
  has_many :books

  def find_shops_with_books #TODO test
    book_ids = self.books.pluck(:id)
    Shop.where(id: Distribution.where(book_id: book_ids).where('copies_in_stock > 0').pluck(:shop_id))
  end

end
