class AddLeaseBuyRentToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :leasebuyrent, :string
  end
end
