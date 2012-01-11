# coding: UTF-8

#Fachhochschule Salzburg, MultiMediaTechnology, 2012
#Fachspezifisches Qualifikationsprojekt 2a
#Entwickler: Lukas Wanko, Sören Hentzschel 

class UsersController < ApplicationController 
  def create
    auth = request.env["omniauth.auth"]
    
    # user already has an account
    if User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      session[:user_id] = user.id
      if request.referer == nil
        redirect_to root_url, :notice => "Herzlich Willkommen!"
      else
        redirect_to request.referer, :notice => "Herzlich Willkommen!"
      end
    # create an account
    else
      user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      flash[:notice] = "Bitte vervollständigen Sie noch Ihr Profil!"
      redirect_to :action => "edit"
    end
  end
  
  def signout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Sie wurden erfolgreich abgemeldet!"
  end
  
  def edit
    add_breadcrumb 'Profil bearbeiten', profile_path
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    
    if @user.update_attributes(params[:user])
      @user.update_attribute(:complete, true) if not @user.complete
      redirect_to root_url, :notice => "Das Profil wurde erfolgreich bearbeitet!"
    else
      render action: "edit"
    end
  end
end
