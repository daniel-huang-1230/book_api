class SingularizeIdColumn < ActiveRecord::Migration[5.2]
  def change

    rename_column :distributions, :books_id, :book_id
    rename_column :distributions, :shops_id, :shop_id
    rename_column :books, :publishers_id, :publisher_id

  end
end
