class RenameJobsType < ActiveRecord::Migration
  def self.up
    rename_column :jobs, :type, :employment_status
  end

  def self.down
    rename_column :jobs, :employment_status, :type
  end
end
