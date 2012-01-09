class RenameDrivesTypeMigration < ActiveRecord::Migration
  def change
    rename_column :drives, :type, :module
  end
end
