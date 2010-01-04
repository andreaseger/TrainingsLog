class SchedulesController < ApplicationController
  filter_resource_access

  def index
    debugger

    @schedules = Schedule.paginate(:page => params[:page], :per_page => 10, :order => 'updated_at DESC')
    #@schedules = Schedule.all
  end

  def show
  end

  def new
  end

  def create
    @schedule.user = current_user
    if @schedule.save
      flash[:notice] = "Successfully created schedule."
      redirect_to @schedule #schedules_url
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @schedule.update_attributes(params[:schedule])
      flash[:notice] = "Successfully updated schedule."
      redirect_to @schedule #schedules_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @schedule.destroy
    flash[:notice] = "Successfully destroyed schedule."
    redirect_to root_url
  end
end

