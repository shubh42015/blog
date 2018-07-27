class RemoveAddressFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Address, :text
  end
end
