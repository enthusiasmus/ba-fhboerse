# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 

require 'user'

class DrivesController < ApplicationController
  add_breadcrumb 'Mitfahrgemeinschaften', '/drives'
  
  def index
    if params[:filter].present?
      if params[:filter] == "t"
        @filter = true
        add_breadcrumb 'Fahre', drives_path + '?filter=t'
      else
        @filter = false
        add_breadcrumb 'Suche', drives_path + '?filter=f'
      end
    end
  
    if params[:filter].present?
      @drives = Drive.where(:isOffer => @filter).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @drives = Drive.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @drive = Drive.find(params[:id])
    
    if @drive.isOffer
      add_breadcrumb 'Fahre', drives_path + '?filter=t'
    else
      add_breadcrumb 'Suche', drives_path + '?filter=f'
    end
    add_breadcrumb @drive.title, drife_path

    if cookies["drive" + @drive.id.to_s] != "disabled"
      cookies["drive" + @drive.id.to_s] = { :value => "disabled", :expires => 2.hour.from_now }
      @drive.update_attribute(:counter, @drive.counter + 1)
    end
  end

  def new
    @drive = Drive.new
    add_breadcrumb 'Anzeige hinzufügen', new_drife_path
  end

  def create
    @drive = Drive.new(params[:drive])
    @drive.user_id = session[:user_id]
    @drive.module = "drive"
    
    if @drive.departure_city && @drive.destination_city
      @drive.title = @drive.departure_city + " nach " + @drive.destination_city
    end
    
    if @drive.save
      redirect_to @drive, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def destroy
    @drive = Drive.find(params[:id])
    @drive.destroy
    redirect_to drives_path, :notice => 'Anzeige wurde erfolgreich gelöscht!'
  end
  
  def filter
  end
  
  def service
  end
  
  def remove_old_articles
    post_ids = Drive.find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      Drive.destroy(post_ids)
    end
  end
end
