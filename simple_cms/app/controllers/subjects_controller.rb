class SubjectsController < ApplicationController
 
  layout "admin"
  before_filter :confirm_logged_in

  def index
    @subjects = Subject.sorted # sorted becoze we have defined sorted in subject model
  end

  def show
    @subjects = Subject.find(params[:id])
  end

  def new
    @subjects = Subject.new
  end

  def create
    #instantiate a new object using form parameter
    @subject =Subject.new(params[:subject]) #save the object
   
    if @subject.save                      #save succeeds , redirect to index action
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')     #if save fails, redisplay (using render) the form so user can fix problems 
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id]) 
    if @subject.update_attributes(params[:subject])       
      flash[:notice] = "Subject updated successfully."        
      redirect_to(:action => 'show', :id => @subject.id) 
    else
      render('edit')
    end
  end


  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
end
