class Order < ActiveRecord::Base
  has_many :product_orders
end
