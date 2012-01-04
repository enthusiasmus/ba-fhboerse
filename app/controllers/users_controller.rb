# coding: UTF-8

class UsersController < ApplicationController 
  def create
    auth = request.env["omniauth.auth"]
    
    # user already has an account
    if User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      session[:user_id] = user.id
      redirect_to request.referer, :notice => "Herzlich Willkommen!"
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
      flash[:notice] = "Das Profil wurde erfolgreich bearbeitet!"
      redirect_to :action => "edit"
    else
      render action: "edit"
    end
  end
end
