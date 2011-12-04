class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.decimal :size
      t.decimal :price
      t.boolean :priceType
      t.date :begin_availability
      t.date :end_availability
      t.integer :amount_of_rooms
      t.boolean :kitchen
      t.boolean :furniture
      t.boolean :garage
      t.boolean :terrace
      t.boolean :garden
      t.text :transport_connection
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
