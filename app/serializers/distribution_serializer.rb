class DistributionSerializer < ActiveModel::Serializer
  attributes :id, :title, :copies_in_stock

  def id
    object.book_id
  end

  def title
    object.book.title
  end
end
