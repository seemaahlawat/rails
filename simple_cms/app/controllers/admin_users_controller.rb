class AdminUsersController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end
  
  def new
    @admin_users = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(params[:admin_users])
    if @admin_user.save
      flash[:notice] = 'Admin User created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end
  
  def edit
    @admin_users = AdminUser.find(params[:id])
  end

  def update
    @admin_users = AdminUser.find(params[:id])
    if @admin_users.update_attributes(params[:admin_users])
      flash[:notice] = 'Admin user updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @admin_users = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'index')
  end

  private

  def admin_user_params
    params.require(:admin_users).permit(:first_name, :last_name, :email, :username, :password)
  end
end
