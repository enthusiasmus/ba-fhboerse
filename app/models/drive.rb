# coding: UTF-8

class Drive < ActiveRecord::Base
  belongs_to :user
  attr_accessible :counter, :agb, :title, :description, :forename, :lastname, :email, :telephone, :offer_or_quest, :departure_street, :departure_zipcode, :departure_city, :departure_country, :departure_date, :destination_street, :destination_zipcode, :destination_city, :destination_country, :destination_date
  
  validates_inclusion_of :offer_or_quest, :in => [true, false], :message => "^Bitte geben Sie den Typ der Anzeige an!"
   
  validates_presence_of :departure_city, :message => "^Bite geben Sie einen Abfahrtsort ein!"
  validates_presence_of :departure_country, :message => "^Bitte geben Sie das Abfahrtsland an!"
  validates_presence_of :departure_date, :message => "^Bitte geben Sie den Zeitpunkt der Abfahrt an!"
  validates_presence_of :destination_city, :message => "^Bitte geben Sie den Ankunftsort an!"
  validates_presence_of :destination_country, :message => "^Bitte geben Sie das Ankunftsland an!"
  
  validates_presence_of :lastname, :message => "^Bitte geben Sie den Nachnamen an!"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '^Bitte geben Sie Ihre korrekte E-Mail-Adresse an!'
  validates_numericality_of :telephone, :message => "^Bitte geben Sie Ihre Telefonnummer an (Ziffern von 0-9)!"

  validates_acceptance_of :agb, :accept => "1", :allow_nil => false, :message => "^Bitte akzeptieren Sie die AGB!"
  
  def self.remove_old
    post_ids = find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      destroy(post_ids)
    end
  end
end
