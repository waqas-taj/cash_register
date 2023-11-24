class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
