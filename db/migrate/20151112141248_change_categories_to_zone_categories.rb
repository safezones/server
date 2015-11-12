class ChangeCategoriesToZoneCategories < ActiveRecord::Migration
  def change
  	rename_table "categories", "ZoneCategories"
  end
end
