class SchedulesController < ApplicationController
  filter_resource_access



  def index
      @tags = Schedule.tag_counts_on(:tags)
      if params[:tag] != nil
        params[:search] = nil
        @schedules = Schedule.withtag(params[:tag],params[:page])
      elsif params[:search] != nil
        @schedules = Schedule.search(params[:search],params[:page])
      else
        @schedules = Schedule.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
      end
    #@schedules = Schedule.all
  end

  def show
    @tags = @schedule.tags
  end

  def new
  end

  def create
    debugger

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

