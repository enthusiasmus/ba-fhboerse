class RenameApartmentIsoffer < ActiveRecord::Migration
  def change
	rename_column :apartments, :isOffer, :is_offer
	rename_column :apartments, :priceType, :price_type
  end
end
