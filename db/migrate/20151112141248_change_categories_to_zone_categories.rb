class ChangeCategoriesToZoneCategories < ActiveRecord::Migration
  def change
  	rename_table "Categories", "ZoneCategories"
  end
end
