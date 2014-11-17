class SectionsController < ApplicationController

  layout "admin"
  before_filter :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def show
    @sections = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
    @pages = Page.order('position ASC')
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(params[:section])
    if @section.save                      #save succeeds , redirect to index action
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')     #if save fails, redisplay (using render) the form so user can fix problems 
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id]) 
    if @section.update_attributes(params[:section])       
      flash[:notice] = "Section updated successfully."        
      redirect_to(:action => 'show', :id => @section.id) 
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
end
