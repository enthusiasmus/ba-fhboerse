class RenameApartmentsForename < ActiveRecord::Migration
  def change
    rename_column :apartments, :forename, :firstname
  end
end
