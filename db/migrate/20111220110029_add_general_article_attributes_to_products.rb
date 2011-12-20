class AddGeneralArticleAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :string
    add_column :products, :description, :text
    add_column :products, :counter, :integer
    add_column :products, :forename, :string
    add_column :products, :lastname, :string
    add_column :products, :email, :string
    add_column :products, :telephone, :integer
    add_column :products, :offer_or_quest, :boolean
    add_column :products, :user_id, :integer
  end
end
