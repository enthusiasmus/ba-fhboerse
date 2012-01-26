class AddDefaultValueToItems < ActiveRecord::Migration
  def change
    change_column :items, :counter, :integer, :default => 0
  end
end
