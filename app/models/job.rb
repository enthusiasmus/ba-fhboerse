# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 

class Job < ActiveRecord::Base
  belongs_to :user
  attr_accessible :counter, :agb, :paid, :salary, :employment_status, :company, :begindate, :place, :qualification, :title, :description, :firstname, :lastname, :email, :telephone, :isOffer

  validates_inclusion_of :isOffer, :in => [true, false], :message => "^Bitte geben Sie den Typ der Anzeige an!"
  
  validates_length_of :title, :within => 5..50, :too_short => "^Der Titel muss mehr als 5 Zeichen besitzen!", :too_long => "Der Titel muss weniger als 100 Zeichen besitzen!"
  validates_length_of :description, :within => 30..1000, :too_short => "^Die Beschreibung muss mehr als 30 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1000 Zeichen besitzen!"
  validates_length_of :qualification, :within => 10..1000, :too_short => "^Die Qualifikationsbeschreibung muss mehr als 10 Zeichen besitzen!", :too_long => "Die Qualifikationsbeschreibung muss weniger als 1000 Zeichen besitzen!"
  validates_presence_of :place, :message => "^Bitte geben Sie den Arbeitsort an"
  validates_presence_of :begindate, :message => "^Bitte geben Sie den Arbeitsbegin an!"
  
  validates_length_of :employment_status, :minimum => 1, :message => "^Bitte geben Sie das Dienstverhältnis an!", :if => :will_be_paid?
  validates_presence_of :lastname, :message => "^Bitte geben Sie den Nachnamen an!"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '^Bitte geben Sie Ihre korrekte E-Mail-Adresse an!'
  validates_numericality_of :telephone, :message => "^Bitte geben Sie Ihre Telefonnummer an (Ziffern von 0-9)!"

  validates_acceptance_of :agb, :accept => "1", :allow_nil => false, :message => "^Bitte akzeptieren Sie die AGB!"

  def will_be_paid?
    paid == true
  end
  def user_title
    self.user.title
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
