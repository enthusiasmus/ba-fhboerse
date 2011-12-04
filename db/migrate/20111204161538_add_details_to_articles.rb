class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :forename, :string
    add_column :articles, :lastname, :string
    add_column :articles, :email, :string
    add_column :articles, :telephone, :integer
  end
end
