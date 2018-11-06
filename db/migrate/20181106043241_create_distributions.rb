class CreateDistributions < ActiveRecord::Migration[5.2]
  def change
    create_table :distributions do |t|
      t.references :books, foreign_key: true
      t.references :shops, foreign_key: true
      t.integer :copies_in_stock, default: 0, null: false
      t.timestamps
    end
  end
end
