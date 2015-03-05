class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :city
      t.string :state
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
  end
end
