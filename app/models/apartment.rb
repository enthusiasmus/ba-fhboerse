# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 

require 'paperclip'

class Apartment < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :styles => { :small => "100x100>", :original => "400x400>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"  
  has_attached_file :photo_two, :styles => { :small => "100x100>", :original => "400x400>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"  
  has_attached_file :photo_three, :styles => { :small => "100x100>", :original => "400x400>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"  
  
  attr_accessible :photo, :photo_two, :photo_three, :counter, :agb, :price, :priceType, :begin_availability, 
  :end_availability, :amount_of_rooms, :kitchen, :furniture, :garage, :terrace, :garden, :transport_connection, 
  :street, :zip_code, :city, :country, :title, :description, :firstname, :lastname, :email, :telephone, 
  :is_offer, :leasebuyrent, :size, :balcony, :lot

  validates_attachment_size :photo_two, :less_than => 5.megabytes, :message => "^Bitte uploaden Sie nur Fotos < 5MB!", :if => :photo_added?
  validates_attachment_content_type :photo_two, :content_type => ['image/jpeg', 'image/png'], :message => "^Bitte uploaden Sie nur JPGs und PNGs!", :if => :photo_added?

  validates_attachment_size :photo_one, :less_than => 5.megabytes, :message => "^Bitte uploaden Sie nur Fotos < 5MB!", :if => :photo_added?
  validates_attachment_content_type :photo_one, :content_type => ['image/jpeg', 'image/png'], :message => "^Bitte uploaden Sie nur JPGs und PNGs!", :if => :photo_added?

  validates_attachment_size :photo, :less_than => 5.megabytes, :message => "^Bitte uploaden Sie nur Fotos < 5MB!", :if => :photo_added?
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png'], :message => "^Bitte uploaden Sie nur JPGs und PNGs!", :if => :photo_added?

  validates_inclusion_of :is_offer, :in => [true, false], :message => "^Bitte geben Sie den Typ der Anzeige an!"
  validates_inclusion_of :leasebuyrent, :in => ["vermietet", "verkauft", "verpachtet"], :message => "^Bitte geben Sie den Typ der Immobilienüberlassung an!"

  validates_length_of :title, :within => 5..50, :too_short => "^Der Titel muss mehr als 5 Zeichen besitzen!", :too_long => "Der Titel muss weniger als 100 Zeichen besitzen!"
  validates_length_of :description, :within => 20..1000, :too_short => "^Die Beschreibung muss mehr als 30 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1000 Zeichen besitzen!"
 
  validates_numericality_of :size, :message => "^Bitte geben Sie die Größe der Immobilie an (Ziffern von 0-9)!"
  validates_numericality_of :amount_of_rooms, :message => "^Bitte geben Sie die Anzahl der Zimmer an (Ziffern von 0-9)!"
 
  validates_presence_of :begin_availability, :message => "^Bitte geben Sie an welche öffentliche Vekehrsanbindung vorhanden ist!"
   
  validates_inclusion_of :kitchen, :in => [true, false], :message => "^Bitte geben Sie an ob eine Küche vorhanden ist!"
  validates_inclusion_of :furniture, :in => [true, false], :message => "^Bitte geben Sie an ob eine Möbilierung vorhanden ist!"
  validates_inclusion_of :balcony, :in => [true, false], :message => "^Bitte geben Sie an ob ein Balkon vorhanden ist!"
  validates_inclusion_of :terrace, :in => [true, false], :message => "^Bitte geben Sie an ob eine Terasse vorhanden ist!"
  validates_inclusion_of :garden, :in => [true, false], :message => "^Bitte geben Sie an ob ein Garten vorhanden ist!"
  validates_inclusion_of :lot, :in => [true, false], :message => "^Bitte geben Sie an ob ein Parkplatz vorhanden ist!"
  validates_inclusion_of :garage, :in => [true, false], :message => "^Bitte geben Sie an ob eine Garage vorhanden ist!"

  validates_presence_of :transport_connection, :message => "^Bitte geben Sie an welche öffentliche Vekehrsanbindung vorhanden ist!"
  
  validates_presence_of :street, :message => "^Bitte geben Sie die Straße!"
  validates_presence_of :zip_code, :message => "^Bitte geben Sie die Postleitzahl an!"
  validates_presence_of :city, :message => "^Bitte geben Sie die Stadt an!"
  validates_presence_of :country, :message => "^Bitte geben sie das Land an!"

  validates_numericality_of :price, :message => "^Bitte geben Sie den Preis an an (Ziffern von 0-9 und '.')!"
  validates_inclusion_of :priceType, :in => [true, false], :message => "^Bitte geben Sie an ob es eine Warm- oder Kaltmiete ist!", :if => :leased_true?

  validates_presence_of :lastname, :message => "^Bitte geben Sie den Nachnamen an!"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '^Bitte geben Sie Ihre korrekte E-Mail-Adresse an!'
  validates_numericality_of :telephone, :message => "^Bitte geben Sie Ihre Telefonnummer an (Ziffern von 0-9)!"

  validates_acceptance_of :agb, :accept => "1", :allow_nil => false, :message => "^Bitte akzeptieren Sie die AGB!"

  def leased_true?
    leasebuyrent == "vermietet"
  end

  def photo_added?
    photo == true
  end
  def photo_two_added?
    photo_two == true
  end
  def photo_three_added?
    photo_three == true
  end
  def user_title
    user.title
  end
  def user_lastname
    user.lastname
  end
  def self.remove_old
    post_ids = find(:all, :conditions => ["created_at < ?", 60.days.ago])
    if post_ids.size > 0
      destroy(post_ids)
    end
  end
end
