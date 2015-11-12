class ChangeCategoriesToZoneCategoriesCurrect < ActiveRecord::Migration
  def change
  	rename_table "ZoneCategories", :zone_categories
  end
end
