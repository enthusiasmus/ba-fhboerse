# coding: UTF-8

require 'user.rb'

class ProductsController < ApplicationController
  add_breadcrumb 'Marktplatz', '/products'
  
  def index    
    condition = ""
    condition_composition = ""
    
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        condition = "offer_or_quest = '1' OR offer_or_quest = 't'"
        add_breadcrumb 'Biete', products_path + '?filter=t'
      else
        condition = "offer_or_quest = '0' OR offer_or_quest = 'f'"
        add_breadcrumb 'Suche', products_path + '?filter=f'
      end
      condition_composition = " AND "
    end
    
    if params[:state_product] != "" && params[:state_product] != nil
      condition += condition_composition + "state = '" + params[:state_product] + "'"
      add_breadcrumb params[:state_product], jobs_path + '?service=' + params[:state_product]
    end
  
    if condition != ""
      @products = Product.where(condition).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @products = Product.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @product = Product.find(params[:id])
    
    if @product.offer_or_quest
      add_breadcrumb 'Biete', products_path + '?filter=t'
    else
      add_breadcrumb 'Suche', products_path + '?filter=f'
    end
    add_breadcrumb @product.title, product_path
    
    @product.counter += 1;
    @product.update_attribute(:counter,@product.counter)
  end

  def new
    @product = Product.new
    add_breadcrumb 'Anzeige hinzufügen', new_product_path
  end

  def create
    @product = Product.new(params[:product])
    @product.counter = 0
    @product.user_id = session[:user_id]

    if @product.save
      redirect_to @product, notice: 'Produkt wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def filter
  end
  
  def state_product
  end
  
  def remove_old_articles
    post_ids = Product.find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      Product.destroy(post_ids)
    end
  end
end

