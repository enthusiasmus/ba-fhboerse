class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.datetime :time
      t.string :place

      t.timestamps
    end
  end
end
