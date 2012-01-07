# coding: UTF-8

class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :counter, :agb, :time, :place, :title, :description, :forename, :lastname, :email, :telephone, :offer_or_quest

  validates_length_of :title, :within => 5..50, :too_short => "^Der Titel muss mehr als 5 Zeichen besitzen!", :too_long => "Der Titel muss weniger als 100 Zeichen besitzen!"
  validates_length_of :description, :within => 30..1000, :too_short => "^Die Beschreibung muss mehr als 30 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1000 Zeichen besitzen!"
  validates_presence_of :place, :message => "^Bitte geben Sie den Ort an"
  validates_presence_of :time, :message => "^Bitte geben Sie die Zeit an!"
  
  validates_presence_of :lastname, :message => "^Bitte geben Sie den Nachnamen an!"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '^Bitte geben Sie Ihre korrekte E-Mail-Adresse an!'
  validates_numericality_of :telephone, :message => "^Bitte geben Sie Ihre Telefonnummer an (Ziffern von 0-9)!"

  validates_acceptance_of :agb, :accept => "1", :allow_nil => false, :message => "^Bitte akzeptieren Sie die AGB!"
end
