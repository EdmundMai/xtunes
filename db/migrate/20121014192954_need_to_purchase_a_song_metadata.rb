class NeedToPurchaseASongMetadata < ActiveRecord::Migration
  def change
    add_column :songs, :cost, :decimal
    add_column :users, :balanace, :decimal
  end
end
