class Job < ActiveRecord::Base
  belongs_to :user
  attr_accessible :paid, :salary, :employment_status, :company, :begindate, :place, :qualification, :title, :description, :forename, :lastname, :email, :telephone, :offer_or_quest

  validates_length_of :title, :within => 5..100, :too_short => "^Der Titel muss mehr als 5 Zeichen besitzen!", :too_long => "Der Titel muss weniger als 100 Zeichen besitzen!"
  validates_length_of :description, :within => 30..1000, :too_short => "^Die Beschreibung muss mehr als 30 Zeichen besitzen!", :too_long => "Die Beschreibung muss weniger als 1000 Zeichen besitzen!"
  validates_length_of :qualification, :within => 10..1000, :too_short => "^Die Qualifikationsbeschreibung muss mehr als 10 Zeichen besitzen!", :too_long => "Die Qualifikationsbeschreibung muss weniger als 1000 Zeichen besitzen!"

  validates_presence_of :place, :message => "^Bitte geben Sie den Arbeitsort an"
  validates_presence_of :begindate, :message => "^Bitte geben Sie den Arbeitsbegin an!"
  
  if :paid == "true"
    validates_numericality_of :salary, :on => :create, :message => "^Bitte geben Sie das Gehalt an (Ziffern von 0-9)!"
  end

  if :company != ""
    validates_presence_of :lastname, :message => "^Bitte geben Sie den Nachnamen an!"
  else
    validates_presence_of :company, :message => "^Bitte geben Sie die Firma an!"
  end
  
  validates_presence_of :email, :message => "^Bitte geben Sie ihre E-Mail-Adresse an!"
  validates_presence_of :telephone, :message => "^Bitte geben Sie ihr Telefonnummer an!"

  validates :agb, :acceptance => true
end
