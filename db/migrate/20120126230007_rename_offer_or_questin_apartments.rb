class RenameOfferOrQuestinApartments < ActiveRecord::Migration
  def change
    rename_column :apartments, :offer_or_quest, :isOffer
  end
end
