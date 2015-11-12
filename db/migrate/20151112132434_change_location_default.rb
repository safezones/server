class ChangeLocationDefault < ActiveRecord::Migration
  def change
  	change_column :children, :last_lon, :float, :default => 0.0
  	change_column :children, :last_lat, :float, :default => 0.0
  	change_column :children, :last_seen, :float, :default => 0.0
  end
end
