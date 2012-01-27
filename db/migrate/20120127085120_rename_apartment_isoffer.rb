class RenameApartmentIsoffer < ActiveRecord::Migration
  def change
	rename_column :apartment, :isOffer, :is_offer
	rename_column :apartment, :priceType, :price_type
  end
end
