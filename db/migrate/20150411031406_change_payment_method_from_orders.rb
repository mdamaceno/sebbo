class ChangePaymentMethodFromOrders < ActiveRecord::Migration
  def change
    change_column :orders, :payment_method, :integer
  end
end
