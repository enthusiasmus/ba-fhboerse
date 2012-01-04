class PagesController < ApplicationController
  def agb
    add_breadcrumb 'AGB', '/agb'
  end

  def about
    add_breadcrumb 'Impressum', '/about'
  end

  def contact
    add_breadcrumb 'Kontakt', '/contact'
  end
end
