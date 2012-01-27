class AddDefaultValueToProducts < ActiveRecord::Migration
  def change
    change_column :products, :counter, :integer, :default => 0
  end
end
