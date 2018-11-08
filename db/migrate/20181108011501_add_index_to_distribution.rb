class AddIndexToDistribution < ActiveRecord::Migration[5.2]
  def change
    add_index :distributions, [:book_id, :shop_id], unique: true
  end
end
