# coding: UTF-8

require 'user.rb'

class DrivesController < ApplicationController
  add_breadcrumb 'Mitfahrgemeinschaften', '/drives'
  
  def index
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        condition = "offer_or_quest = '1' OR offer_or_quest = 't'"
        add_breadcrumb 'Fahre', drives_path + '?filter=t'
      else
        condition = "offer_or_quest = '0' OR offer_or_quest = 'f'"
        add_breadcrumb 'Suche', drives_path + '?filter=f'
      end
    end

    if condition != ""
      @drives = Drive.where(condition).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @drives = Drive.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @drive = Drive.find(params[:id])
    
    if @drive.offer_or_quest
      add_breadcrumb 'Fahre', drives_path + '?filter=t'
    else
      add_breadcrumb 'Suche', drives_path + '?filter=f'
    end
    add_breadcrumb @drive.title, drife_path
    
    @drive.counter += 1;
    @drive.update_attribute(:counter, @drive.counter)
  end

  def new
    @drive = Drive.new
    add_breadcrumb 'Anzeige hinzufügen', new_drife_path
  end

  def create
    @drive = Drive.new(params[:drive])
    @drive.counter = 0
    @drive.user_id = session[:user_id]
    
    if @drive.departure_city && @drive.destination_city
      @drive.title = @drive.departure_city + " nach " + @drive.destination_city
    end
    
    if @drive.save
      redirect_to @drive, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
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
