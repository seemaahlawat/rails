class AccessController < ApplicationController
  
  layout 'admin'

  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
  	# display text & links 
  end

  def login
  	# login form
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "you are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
  	flash[:notice] = "Logged Out"
    redirect_to(:action => "login")
  end

end
