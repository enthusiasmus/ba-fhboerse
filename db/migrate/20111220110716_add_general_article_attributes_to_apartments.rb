class AddGeneralArticleAttributesToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :title, :string
    add_column :apartments, :description, :text
    add_column :apartments, :counter, :integer
    add_column :apartments, :forename, :string
    add_column :apartments, :lastname, :string
    add_column :apartments, :email, :string
    add_column :apartments, :telephone, :integer
    add_column :apartments, :offer_or_quest, :boolean
    add_column :apartments, :user_id, :integer
  end
end
