class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # prevent CSRF attacks by raising an exception.

private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false #halt the before_action
    else
      return true
    end
  end
  
end
