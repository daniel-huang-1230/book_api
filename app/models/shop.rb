class Shop < ApplicationRecord
  has_many :distributions, dependent: :destroy
  has_many :books, :through => :distributions

  default_scope { order(books_sold_count: :desc) }

  # find the shops that sell at least one of the books from a particular publisher
  # TODO test
  scope :selling_books, ->(book_ids) do
    joins(:distributions).where('distributions.book_id IN (?)',  book_ids)
  end


  def update_sold_count copies_sold
    self.books_sold_count += copies_sold
    self.save
  end

  
end
