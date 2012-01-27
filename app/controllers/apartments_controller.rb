# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 
    
require 'user'

class ApartmentsController < ApplicationController
  add_breadcrumb 'Wohnungsbörse', '/apartments'
  
  def index        
    if params[:filter].present?
      if params[:filter] == "t"
        @filter = true
        add_breadcrumb 'Biete', apartments_path + '?filter=t'
      else
        @filter = false
        add_breadcrumb 'Suche', apartments_path + '?filter=f'
      end
    end
    
    if params[:type_of_leasebuyrent].present?
      if params[:type_of_leasebuyrent] == "vermietet"
        add_breadcrumb "Miete", jobs_path + '?leasebuyrent=' + params[:type_of_leasebuyrent]
      elsif params[:type_of_leasebuyrent] == "verkauft"
        add_breadcrumb "Kauf", jobs_path + '?leasebuyrent=' + params[:type_of_leasebuyrent]
      else params[:type_of_leasebuyrent] == "verpachtet"
        add_breadcrumb "Pacht", jobs_path + '?leasebuyrent=' + params[:type_of_leasebuyrent]
      end
    end
  
    if params[:filter].present? && params[:type_of_leasebuyrent].present?
      @apartments = Apartment.where(:is_offer => @filter, :leasebuyrent => params[:type_of_leasebuyrent]).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    elsif params[:type_of_leasebuyrent].present?
      @apartments = Apartment.where(:leasebuyrent => params[:type_of_leasebuyrent]).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    elsif params[:filter].present?
      @apartments = Apartment.where(:is_offer => @filter).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @apartments = Apartment.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
    
    if @apartment.is_offer
      add_breadcrumb 'Biete', apartments_path + '?filter=t'
    else
      add_breadcrumb 'Suche', apartments_path + '?filter=f'
    end
    add_breadcrumb @apartment.title, apartment_path
    
    if cookies["apartment" + @apartment.id.to_s] != "disabled"
      cookies["apartment" + @apartment.id.to_s] = { :value => "disabled", :expires => 2.hour.from_now }
      @apartment.update_attribute(:counter, @apartment.counter + 1)
    end
  end

  def new
    @apartment = Apartment.new
    add_breadcrumb 'Anzeige hinzufügen', new_apartment_path
  end

  def create
    @apartment = Apartment.new(params[:apartment])
    @apartment.user_id = session[:user_id]
    @apartment.module = "apartment"

    if @apartment.save
      redirect_to @apartment, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect_to apartments_path, :notice => 'Anzeige wurde erfolgreich gelöscht!'
  end
end

