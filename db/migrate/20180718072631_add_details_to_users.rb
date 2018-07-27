class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :First_name, :string
    add_column :users, :Last_name, :string
    add_column :users, :Address, :text
    add_column :users, :Mobile_no, :string
  end
end
