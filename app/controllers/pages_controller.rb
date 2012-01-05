class PagesController < ApplicationController
  def agb
    add_breadcrumb 'AGB', '/pages/agb'
  end

  def about
    add_breadcrumb 'Impressum', '/pages/about'
  end

  def contact
    add_breadcrumb 'Kontakt', '/pages/contact'
  end
end
