class RemoveCreatorFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :creator
  end

  def down
    add_column :articles, :creator, :string
  end
end
