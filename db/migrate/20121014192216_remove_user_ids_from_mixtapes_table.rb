class RemoveUserIdsFromMixtapesTable < ActiveRecord::Migration
  def change
    remove_column :mixtapes, :user_id
  end

end
