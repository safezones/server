class ChangeCategoryToZoneCategoryInSafeZones < ActiveRecord::Migration
  def change
  	rename_column :safe_zones, :category_id, :zone_category_id
  end
end
