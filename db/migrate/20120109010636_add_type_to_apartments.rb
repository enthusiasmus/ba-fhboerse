class AddTypeToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :type, :string
  end
end
