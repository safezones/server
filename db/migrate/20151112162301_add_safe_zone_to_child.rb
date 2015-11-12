class AddSafeZoneToChild < ActiveRecord::Migration
  def change
	add_column :children, :safe_zone, :integer, :default => -1
  end
end
