# coding: UTF-8

require 'user.rb'

class ItemsController < ApplicationController
  add_breadcrumb 'Fundgrube', '/items'
  
  def index    
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        condition = "offer_or_quest = '1' OR offer_or_quest = 't'"
        add_breadcrumb 'Gefunden', items_path + '?filter=t'
      else
        condition = "offer_or_quest = '0' OR offer_or_quest = 'f'"
        add_breadcrumb 'Suche', items_path + '?filter=f'
      end
    end
  
    if condition != ""
      @items = Item.where(condition).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @items = Item.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @item = Item.find(params[:id])
    
    if @item.offer_or_quest
      add_breadcrumb 'Gefunden', items_path + '?filter=t'
    else
      add_breadcrumb 'Suche', items_path + '?filter=f'
    end
    add_breadcrumb @item.title, item_path
    
    @item.counter += 1;
    @item.update_attribute(:counter, @item.counter)
  end

  def new
    @item = Item.new
    add_breadcrumb 'Anzeige hinzufügen', new_item_path
  end

  def create
    @item = Item.new(params[:item])
    @item.counter = 0
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

