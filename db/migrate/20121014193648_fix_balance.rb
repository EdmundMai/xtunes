class FixBalance < ActiveRecord::Migration
  def change
    remove_column :users, :balanace
    add_column :users, :balance, :integer
  end

end
