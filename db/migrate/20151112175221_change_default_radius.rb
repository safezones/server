class ChangeDefaultRadius < ActiveRecord::Migration
  def change
  	change_column :safe_zones, :radius, :float, :default => 0.186411358
  end
end
