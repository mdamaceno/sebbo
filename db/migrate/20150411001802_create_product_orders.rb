class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|
      t.integer :product_id
      t.string  :product_name
      t.text    :product_description
      t.decimal :product_price
      t.integer :product_quantity
      t.references :user,  index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_orders, :users
    add_foreign_key :product_orders, :orders
  end
end
