require 'job.rb'
require 'user.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  before_filter :set_var
  
  protected
  
  def add_breadcrumb name, url = ''
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url]
  end
 
  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_var
    @most_popular_jobs = Job.order("counter DESC").all(:limit => 4)
    @newest_jobs = Job.order("created_at DESC").all(:limit => 4)
    
    @most_popular_drives = Drive.order("counter DESC").all(:limit => 4)
    @newest_drives = Drive.order("created_at DESC").all(:limit => 4)
    
    @most_popular_products = Product.order("counter DESC").all(:limit => 4)
    @newest_products = Product.order("created_at DESC").all(:limit => 4)
    
    @most_popular_apartments = Apartment.order("counter DESC").all(:limit => 4)
    @newest_apartments = Apartment.order("created_at DESC").all(:limit => 4)
    
    @most_popular_items = Item.order("counter DESC").all(:limit => 4)
    @newest_items = Item.order("created_at DESC").all(:limit => 4)
    
    @most_popular_articles = (
      @most_popular_jobs + @most_popular_drives + @most_popular_products + @most_popular_apartments + @most_popular_items
    ).sort_by(&:counter).reverse![0..3]
    @newest_articles = (
      @newest_jobs + @newest_drives + @newest_products + @newest_apartments + @newest_items
    ).sort_by(&:created_at).reverse![0..3]
  end
end
