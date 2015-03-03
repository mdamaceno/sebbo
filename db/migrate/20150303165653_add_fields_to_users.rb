class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string :name
      t.integer :gender
      t.string :address
      t.string :contact1
      t.string :contact2
      t.string :doc
    end
  end
end
