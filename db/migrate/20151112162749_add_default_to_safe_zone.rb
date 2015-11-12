class AddDefaultToSafeZone < ActiveRecord::Migration
  def change
	change_column :safe_zones, :lat, :float, :default => 0.0
	change_column :safe_zones, :lon, :float, :default => 0.0
	change_column :safe_zones, :radius, :float, :default => 0.0
	change_column :safe_zones, :address, :string, :default => ""

  end
end
