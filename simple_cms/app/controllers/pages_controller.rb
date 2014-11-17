class PagesController < ApplicationController

  layout "admin"
  before_filter :confirm_logged_in
  before_filter :find_subject

  def index
    @pages = Page.sorted
    # @pages = @subject.pages.sorted if @subject

  end

  def show
    @pages = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page]) 
    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
 
  def edit
    @page = Page.find(params[:id])
  end

  def update 
    @page = Page.find(params[:id]) 
    if @page.update_attributes(params[:page])   
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show',:id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id]) 
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
    if @subject.nil?
      flash[:error] = "subject not found"
    end
  end

end
