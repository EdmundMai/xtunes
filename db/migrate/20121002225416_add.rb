class Add < ActiveRecord::Migration
  def up
  	add_column :albums, :photo, :string
  end

  def down
  end
end
