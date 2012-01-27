class AddDefaultValueToJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :counter, :integer, :default => 0
  end
end
