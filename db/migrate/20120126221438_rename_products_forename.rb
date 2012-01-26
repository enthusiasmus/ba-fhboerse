class RenameProductsForename < ActiveRecord::Migration
  def change
    rename_column :products, :forename, :firstname
  end
end
