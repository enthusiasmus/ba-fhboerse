class RenameOfferOrQuestinProducts < ActiveRecord::Migration
  def change
    rename_column :products, :offer_or_quest, :isOffer
  end
end
