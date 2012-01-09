#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel

class PagesController < ApplicationController
  def agb
    add_breadcrumb 'AGB', '/pages/agb'
  end

  def about
    add_breadcrumb 'Impressum', '/pages/about'
  end
end
