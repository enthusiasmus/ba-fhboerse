class Job < ActiveRecord::Base
  belongs_to :user
  attr_accessible :paid, :salary, :employment_status, :company, :begindate, :place, :qualification, :title, :description, :forename, :lastname, :email, :telephone, :offer_or_quest

  validates_numericality_of :salary, :on => :create, :message => "Geben Sie bitte als Bezahlung nur Ziffern von 0-9 an!"
  
  validates_presence_of :paid, :message => "Geben Sie bitte die Art der Arbeit an!"
  validates_presence_of :lastname, :message => "Geben Sie bitte die Art der Arbeit an!"
  validates_presence_of :email, :message => "Geben Sie bitte ihre E-Mail-Adresse an!"
  validates_presence_of :telephone, :message => "Geben Sie bitte ihr Telefonnummer an!"
  validates_presence_of :offer_or_quest, :message => "Geben Sie bitte den Typ der Annonce an!"
  validates_presence_of :begindate, :message => "Geben Sie bitte ein Datum fuer den Begin der Arbeit an!"

  validates_length_of :title, :within => 4..50, :too_short => "Der Titel muss mehr als 4 Zeichen besitzen!", :too_long => "Der Titel muss weniger als 50 Zeichen besitzen!"
  validates_length_of :description, :within => 30..1500, :too_short => "Die Beschreibung muss mehr als 30 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1500 Zeichen besitzen!"
  validates_length_of :qualification, :within => 10..1500, :too_short => "Die Beschreibung muss mehr als 10 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1500 Zeichen besitzen!"
end
