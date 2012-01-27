# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel

require 'user'

class ItemsController < ApplicationController
  add_breadcrumb 'Fundgrube', '/items'
  
  def index    
    if params[:filter].present?
      if params[:filter] == "t"
        @filter = true
        add_breadcrumb 'Gefunden', items_path + '?filter=t'
      else
        @filter = false
        add_breadcrumb 'Suche', items_path + '?filter=f'
      end
    end
  
    if params[:filter].present?
      @items = Item.where(:is_offer => @filter).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @items = Item.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @item = Item.find(params[:id])
    
    if @item.is_offer
      add_breadcrumb 'Gefunden', items_path + '?filter=t'
    else
      add_breadcrumb 'Suche', items_path + '?filter=f'
    end
    add_breadcrumb @item.title, item_path

    if cookies["item" + @item.id.to_s] != "disabled"
      cookies["item" + @item.id.to_s] = { :value => "disabled", :expires => 2.hour.from_now }
      @item.update_attribute(:counter, @item.counter + 1)
    end
  end

  def new
    @item = Item.new
    add_breadcrumb 'Anzeige hinzufügen', new_item_path
  end

  def create
    @item = Item.new(params[:item])
    @item.user_id = session[:user_id]
    @item.module = "item"

    if @item.save
      redirect_to @item, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, :notice => 'Anzeige wurde erfolgreich gelöscht!'
  end
  
  def filter
  end
  
  def remove_old_articles
    post_ids = Item.find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      Item.destroy(post_ids)
    end
  end
end

