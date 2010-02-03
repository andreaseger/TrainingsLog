class StaticsController < ApplicationController
  filter_access_to :index, :edit, :update, :destroy, :new
  def index
    @statics = Static.all
  end
  
  def show
    debugger
  	if params[:permalink]
  		@static = Static.find_by_permalink(params[:permalink])
  		raise ActiveRecord::RecordNotFound, "Page not found" if @static.nil?
  	else
      @static = Static.find(params[:id])
    end
  end

  def new
    @static = Static.new
  end
  
  def create
    @static = Static.new(params[:static])
    if @static.save
      flash[:notice] = "Successfully created static."
      redirect_to @static
    else
      render :action => 'new'
    end
  end
  
  def edit
    @static = Static.find(params[:id])
  end
  
  def update
    @static = Static.find(params[:id])
    if @static.update_attributes(params[:static])
      flash[:notice] = "Successfully updated static."
      redirect_to @static
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @static = Static.find(params[:id])
    @static.destroy
    flash[:notice] = "Successfully destroyed static."
    redirect_to statics_url
  end
end
