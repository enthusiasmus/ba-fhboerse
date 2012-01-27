# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel

require 'user.rb'

class ProductsController < ApplicationController
  add_breadcrumb 'Marktplatz', '/products'
  
  def index    
    if params[:filter].present?
      if params[:filter] == "t"
        @filter = true
        add_breadcrumb 'Biete', products_path + '?filter=t'
      else
        @filter = false
        add_breadcrumb 'Suche', products_path + '?filter=f'
      end
    end

    if params[:state_product].present?
      add_breadcrumb params[:state_product], products_path + '?service=' + params[:state_product]
    end
  
    if params[:filter].present? && params[:state_product].present?
      @products = Product.where(:isOffer => @filter, :state => params[:state_product]).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    elsif params[:type_of_leasebuyrent].present?
      @products = Product.where(:state => @filter).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    elsif params[:filter].present?
      @products = Product.where(:isOffer => @filter).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @products = Product.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
  end

  def show
    @product = Product.find(params[:id])
    
    if @product.isOffer
      add_breadcrumb 'Biete', products_path + '?filter=t'
    else
      add_breadcrumb 'Suche', products_path + '?filter=f'
    end
    add_breadcrumb @product.title, product_path
    
    @product.update_attribute(:counter, @product.counter + 1)
  end

  def new
    @product = Product.new
    add_breadcrumb 'Anzeige hinzufügen', new_product_path
  end

  def create
    @product = Product.new(params[:product])
    @product.user_id = session[:user_id]
    @product.module = "product"

    if @product.save
      redirect_to @product, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, :notice => 'Anzeige wurde erfolgreich gelöscht!'
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

