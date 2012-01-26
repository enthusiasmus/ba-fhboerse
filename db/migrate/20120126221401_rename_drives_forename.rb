class RenameDrivesForename < ActiveRecord::Migration
  def change
    rename_column :drives, :forename, :firstname
  end
end
