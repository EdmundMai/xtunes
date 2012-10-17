class AddLikeToSongsTable < ActiveRecord::Migration
  def change
  	add_column :songs, :like, :integer, :default => 0
  end
end
