class SessionController < ApplicationController

  def new
  end

  def login
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  	  session[:user_id] = user.id
  	  redirect_to songs_path
  	else
  	  render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to songs_path
  end



end
