class AddOfferOrQuestToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :offer_or_quest, :boolean
  end
end
