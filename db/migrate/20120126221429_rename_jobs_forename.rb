class RenameJobsForename < ActiveRecord::Migration
  def change
    rename_column :jobs, :forename, :firstname
  end
end
