class RenameItemsTypeMigration < ActiveRecord::Migration
  def change
    rename_column :items, :type, :module
  end
end
