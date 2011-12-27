class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = Session.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Session.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to request.referer, :notice => "Herzlich Willkommen, " + user.name + "!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to request.referer, :notice => "Du wurdest erfolgreich abgemeldet!"
  end
end
