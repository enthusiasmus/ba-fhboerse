# coding: UTF-8

require 'user.rb'

class HomeController < ApplicationController
  def index
    @my_jobs = Job.order("counter DESC").where("user_id = '#{session[:user_id]}'")
    @my_drives = Drive.order("counter DESC").where("user_id = '#{session[:user_id]}'")
    @my_products = Product.order("counter DESC").where("user_id = '#{session[:user_id]}'")
    @my_apartments = Apartment.order("counter DESC").where("user_id = '#{session[:user_id]}'")
    @my_items = Item.order("counter DESC").where("user_id = '#{session[:user_id]}'")
    
    @my_articles = (@my_jobs + @my_drives + @my_products + @my_apartments + @my_items).sort_by(&:created_at).reverse!
  end
end
