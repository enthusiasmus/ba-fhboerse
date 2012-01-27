class AddDefaultValueToApartments < ActiveRecord::Migration
  def change
    change_column :apartments, :counter, :integer, :default => 0
  end
end
