# coding: UTF-8

require 'user.rb'

class ItemsController < ApplicationController
  add_breadcrumb 'Fundgrube', '/items'
  
  def index    
    condition = ""
    condition_composition = ""
  
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        condition += "offer_or_quest = '1' OR offer_or_quest = 't'"
        add_breadcrumb 'Biete', items_path + '?filter=t'
      else
        condition += "offer_or_quest = '0' OR offer_or_quest = 'f'"
        add_breadcrumb 'Suche', items_path + '?filter=f'
      end
      condition_composition = " AND "
    end
    
    if params[:service] != "" && params[:service] != nil
      if params[:service] == "Freiwillig"
        condition += condition_composition + "paid = '0' OR paid = 'f'"
      else
        condition += condition_composition + "employment_status = '" + params[:service] + "'"
      end
      add_breadcrumb params[:service], items_path + '?service=' + params[:service]
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
      add_breadcrumb 'Biete', items_path + '?filter=t'
    else
      add_breadcrumb 'Suche', items_path + '?filter=f'
    end
    add_breadcrumb @item.title, item_path
    
    @item.counter += 1;
    @item.update_attribute(:counter,@item.counter)
  end

  def new
    @item = Item.new
    add_breadcrumb 'Neue Anzeige hinzufügen', new_item_path
  end

  def create
    @item = Item.new(params[:item])
    @item.counter = 0
    @item.user_id = session[:user_id]

    if @item.save
      redirect_to @item, notice: 'Gegenstand wurde erfolgreich hinzugefügt'
    else
      render action: "new"
    end
  end
  
  def filter
  end
  
  def service
  end
  
  def remove_old_articles
    post_ids = Item.find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      Post.destroy(post_ids)
    end
  end
end

