# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 

require 'user.rb'

class ApartmentsController < ApplicationController
  add_breadcrumb 'Wohnungsbörse', '/apartments'
  
  def index        
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        @filter = true
        add_breadcrumb 'Biete', apartments_path + '?filter=t'
      else
        @filter = false
        add_breadcrumb 'Suche', apartments_path + '?filter=f'
      end
    end
    
    if params[:type_of_leasebuyrent] != "" && params[:type_of_leasebuyrent] != nil
      if params[:type_of_leasebuyrent] == "vermietet"
        add_breadcrumb "Miete", jobs_path + '?leasebuyrent=' + params[:type_of_leasebuyrent]
      elsif params[:type_of_leasebuyrent] == "verkauft"
        add_breadcrumb "Kauf", jobs_path + '?leasebuyrent=' + params[:type_of_leasebuyrent]
      else params[:type_of_leasebuyrent] == "verpachtet"
        add_breadcrumb "Pacht", jobs_path + '?leasebuyrent=' + params[:type_of_leasebuyrent]
      end
    end
  
    if params[:filter] != "" && params[:filter] != nil && params[:type_of_leasebuyrent] != "" && params[:type_of_leasebuyrent] != nil
      @apartments = Apartment.where(:offer_or_quest => @filter, :leasebuyrent => params[:type_of_leasebuyrent]).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    elsif params[:type_of_leasebuyrent] != "" && params[:type_of_leasebuyrent] != nil
      @apartments = Apartment.where(:leasebuyrent => params[:type_of_leasebuyrent]).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    elsif params[:filter] != "" && params[:filter] != nil
      @apartments = Apartment.where(:offer_or_quest => @filter).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @apartments = Apartment.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
    
    if @apartment.offer_or_quest
      add_breadcrumb 'Biete', apartments_path + '?filter=t'
    else
      add_breadcrumb 'Suche', apartments_path + '?filter=f'
    end
    add_breadcrumb @apartment.title, apartment_path
    
    @apartment.counter += 1;
    @apartment.update_attribute(:counter, @apartment.counter)
  end

  def new
    @apartment = Apartment.new
    add_breadcrumb 'Anzeige hinzufügen', new_apartment_path
  end

  def create
    @apartment = Apartment.new(params[:apartment])
    @apartment.counter = 0
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

