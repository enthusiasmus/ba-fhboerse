#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 

class User < ActiveRecord::Base
  has_many :jobs, :dependent => :restrict
  has_many :drives, :dependent => :restrict
  has_many :items, :dependent => :restrict
  has_many :products, :dependent => :restrict
  has_many :apartments, :dependent => :restrict
  
  attr_accessible :title, :forename, :lastname, :email, :complete
  
  validates_presence_of :title, :message => "^Bitte geben Sie einen Titel an", :on => :update
  validates_presence_of :forename, :message => "^Bitte geben Sie Ihren Vornamen an", :on => :update
  validates_presence_of :lastname, :message => "^Bitte geben Sie Ihren Nachnamen an", :on => :update
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '^Bitte geben Sie Ihre korrekte E-Mail-Adresse an!', :on => :update
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.forename = auth["info"]["first_name"]
      user.lastname = auth["info"]["last_name"]
      
      if auth["extra"]["raw_info"]["gender"] == "male"
        user.title = "Herr"
      elsif auth["extra"]["raw_info"]["gender"] == "female"
        user.title = "Frau"
      end
      
      user.complete = false;
    end
  end
end
