class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :books_sold_count, default: 0, null: false
      t.timestamps
    end
  end
end
