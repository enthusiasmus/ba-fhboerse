# coding: UTF-8

require 'user.rb'

class ApartmentsController < ApplicationController
  add_breadcrumb 'Wohnungsbörse', '/apartments'
  
  def index    
    condition = ""
    condition_composition = ""
    
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        condition = "offer_or_quest = '1' OR offer_or_quest = 't'"
        add_breadcrumb 'Biete', apartments_path + '?filter=t'
      else
        condition = "offer_or_quest = '0' OR offer_or_quest = 'f'"
        add_breadcrumb 'Suche', apartments_path + '?filter=f'
      end
      condition_composition = " AND "
    end
    
    if params[:type_of_leasebuyrent] != "" && params[:type_of_leasebuyrent] != nil
      condition += condition_composition + "leasebuyrent = '" + params[:type_of_leasebuyrent] + "'" 
      if params[:type_of_leasebuyrent] == "vermietet"
        add_breadcrumb "Miete", jobs_path + '?service=' + params[:type_of_leasebuyrent]
      elsif params[:type_of_leasebuyrent] == "verkauft"
        add_breadcrumb "Kauf", jobs_path + '?service=' + params[:type_of_leasebuyrent]
      else params[:type_of_leasebuyrent] == "verpachtet"
        add_breadcrumb "Pacht", jobs_path + '?service=' + params[:type_of_leasebuyrent]
      end
    end
  
    if condition != ""
      @apartments = Apartment.where(condition).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
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

    if @apartment.save
      redirect_to @apartment, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def filter
  end
  
  def type_of_apartment
  end
  
  def remove_old_articles
    post_ids = Apartment.find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      Apartment.destroy(post_ids)
    end
  end
end

