class AddFieldToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :field4, :string, after: :field3
    add_column :addresses, :zipcode, :string, after: :state
  end
end
