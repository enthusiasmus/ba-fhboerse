# coding: UTF-8

class Product < ActiveRecord::Base
  belongs_to :user
  attr_accessible :counter, :agb, :price, :state, :title, :description, :forename, :lastname, :email, :telephone, :offer_or_quest

  validates_inclusion_of :offer_or_quest, :in => [true, false], :message => "^Bitte geben Sie den Typ der Anzeige an!"
  
  validates_length_of :title, :within => 5..50, :too_short => "^Der Titel muss mehr als 5 Zeichen besitzen!", :too_long => "Der Titel muss weniger als 100 Zeichen besitzen!"
  validates_length_of :description, :within => 20..1000, :too_short => "^Die Beschreibung muss mehr als 30 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1000 Zeichen besitzen!"
  validates_presence_of :state, :message => "^Bitte geben sie den Zustand an!"
  validates_numericality_of :price, :message => "^Bitte geben Sie den Preis an an (Ziffern von 0-9 und '.')!"
  
  validates_presence_of :lastname, :message => "^Bitte geben Sie den Nachnamen an!"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '^Bitte geben Sie Ihre korrekte E-Mail-Adresse an!'
  validates_numericality_of :telephone, :message => "^Bitte geben Sie Ihre Telefonnummer an (Ziffern von 0-9)!"

  validates_acceptance_of :agb, :accept => "1", :allow_nil => false, :message => "^Bitte akzeptieren Sie die AGB!"
end
