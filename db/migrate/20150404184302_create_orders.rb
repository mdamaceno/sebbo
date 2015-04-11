class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date    :day_of_payment
      t.string  :user_seller_name
      t.string  :user_buyer_name
      t.string  :user_seller_cpf
      t.string  :user_buyer_cpf
      t.string  :payment_method
      t.string  :address
      t.string  :zipcode
      t.string  :state
      t.string  :city
      t.string  :price
      t.integer :status
      t.references :user,  index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
  end
end
