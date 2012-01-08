class AddLotBalconyToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :balcony, :boolean
    add_column :apartments, :lot, :boolean
  end
end
