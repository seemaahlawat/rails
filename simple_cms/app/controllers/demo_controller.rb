class DemoController < ApplicationController
 layout false;
  def index
	# render('hello')
  end

  def hello
  	@array = [1,3,4,5,7,7]
  	@id = params['id']
  	@page = params[:page]
  end

end
