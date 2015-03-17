class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :code
      t.string :slug
      t.decimal :price
      t.boolean :sold
      t.integer :quantity
      t.boolean :featured
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :users
    add_foreign_key :products, :categories
  end
end
