class RenameItemsProductsMigration < ActiveRecord::Migration
  def change
    rename_column :products, :type, :module
  end
end
