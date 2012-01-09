class ContactUs::ContactsController < ApplicationController
  def create
    @contact = ContactUs::Contact.new(params[:contact_us_contact])

    if @contact.save
      redirect_to('/', :notice => t('Ihre E-Mail wurde erfolgreich versendet!'))
    else
      flash[:error] = t('Bitte geben Sie eine korrekte E-Mail-Adresse an!')
      render :new
    end
  end

  def new
    add_breadcrumb 'Kontakt', '/contact_us'
    @contact = ContactUs::Contact.new
  end
end
