class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :gender, :integer, null: false
    add_column :users, :age, :integer, null: false
  end
end
