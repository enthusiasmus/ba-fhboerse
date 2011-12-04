class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :departure_street
      t.string :departure_zipcode
      t.string :departure_city
      t.string :departure_country
      t.datetime :departure_date
      t.string :destination_street
      t.string :destination_zipcode
      t.string :destination_city
      t.string :destination_country
      t.datetime :destination_date

      t.timestamps
    end
  end
end
