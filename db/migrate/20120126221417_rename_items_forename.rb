class RenameItemsForename < ActiveRecord::Migration
  def change
    rename_column :items, :forename, :firstname
  end
end
