class ChangeCategoryToZoneCategoryInSafeZones < ActiveRecord::Migration
  def change
  		change_column :safe_zones, :category_id, :zone_category_id, :default => 0.0
  end
end
