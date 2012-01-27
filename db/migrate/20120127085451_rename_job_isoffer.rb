class RenameJobIsoffer < ActiveRecord::Migration
  def change
	rename_column :jobs, :isOffer, :is_offer
  end
end
