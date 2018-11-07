class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :books_sold_count
  has_many :books_in_stock

  def books_in_stock
    object.distributions
  end
end
