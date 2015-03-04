class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.integer :role
      t.integer :gender
      t.string :name
      t.string :address
      t.string :contact1
      t.string :contact2
      t.string :doc
      t.string :avatar
      t.text :description
    end
  end
end
