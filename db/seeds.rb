# coding => UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name => 'Chicago' }, :{ name => 'Copenhagen' }])
#   Mayor.create(name => 'Emanuel', :city => cities.first)

Job.create(:paid => 'true', :salary => '1000', :employment_status => 'Vollzeit', :company => 'Quelle', :begindate => '31.01.2012', :place => 'Salzburg', :qualification => 'Soziale Fähigkeiten besonders wichtig!', :title => 'Suche engagierten Arbeiter!', :description => 'Du brauchst Geld? Dann melde dich bei uns!', :forename => 'Lukas', :lastname => 'Wanko', :telephone => '065892309', :isOffer => 'true', :user_id => '1', :module => 'jobs')
Product.create(:price => 'true', :state => 'gebraucht', :title => 'Wollmütze', :description => 'Selbst gestrickt!', :forename => 'Lukas', :lastname => 'Wanko', :telephone => '065890234', :isOffer => '', :user_id => '1', :module => 'products')
Apartment.create(:size => 'true', :price => '390', :title => 'Strandhaus', :description => 'Direkt am Meer, mit Strand!', :forename => 'Lukas', :lastname => 'Wanko', :telephone => '065934234', :isOffer => 'true', :user_id => '1', :module => 'apartment', :priceType => 'true', :amount_of_rooms => '4', :begin_availability => '31.01.2012', :end_availability => '31.01.2014', :kitchen => 'true', :furniture => 'true', :garage => 'true', :terrace => 'true', :garden => 'true', :transport_connection => 'Bushaltestelle gleich um die Ecke!', :street => 'Wunschstraße 7', :zip_code => '5020', :country => 'Österreich')
Drive.create(:departure_street => 'Urstein Süd 1', :departure_zipcode => '5412', :departure_city => 'Puch bei Hallein', :departure_country => 'Österreich', :departure_date => '31.01.2012', :destination_street => 'Getreidegasse 1', :destination_zipcode => '5020', :destination_city => 'Salzburg', :destination_country => 'Österreich', :destination_date => '31.01.2012', :description => 'Hab ein großes Auto! 6 Sitzer!', :forename => 'Lukas', :lastname => 'Wanko', :telephone => '0658923423', :isOffer => 'true', :user_id => '1', :module => 'drive', :drivetype => 'true')
Item.create(:time => '31.01.2012', :place => 'Salzburg Hanuschplatz', :title => 'USB-Stick', :description => 'Blau, 16 GB', :forename => 'Lukas', :lastname => 'Wanko', :telephone => '065234902', :isOffer => 'true', :user_id => '1', :module => 'items')
User.create(:email => 'lukas.wanko@web.de', :title => 'Herr', :firstname => 'Lukas', :lastname => 'Wanko', :provider => 'Facebook', :complete => 'true')