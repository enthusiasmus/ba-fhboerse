class RenameItemsJobsMigration < ActiveRecord::Migration
  def change
    rename_column :jobs, :type, :module
  end
end
