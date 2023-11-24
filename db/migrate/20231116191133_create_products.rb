class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :name, default: ''
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
