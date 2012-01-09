class RenameApartmentsTypeMigration < ActiveRecord::Migration
  def change
    rename_column :apartments, :type, :module
  end
end
