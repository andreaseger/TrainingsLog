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
  end

  def show
    @tags = @schedule.tags
    debugger
    @schedulings = @schedule.schedulings
  end

  def new
    @schedulings = Array.new
    8.times{@schedulings << Scheduling.new}
  end

  def create
    @schedule.user = current_user
    if @schedule.save
      params[:schedule][:schedulings].each do |scheduling|
        scheduling.merge!(:schedule_id => @schedule.id)
        debugger
        Scheduling.create!(scheduling) unless scheduling.values.any?(&:blank?)
      end

      flash[:notice] = "Successfully created schedule."
      redirect_to @schedule #schedules_url
    else
      render :action => 'new'
    end
  end

  def edit
    @schedulings = Scheduling.find(:schedule_id => params[:id])
  end

  def update
    debugger
    @schedulings = Scheduling.find(:schedule_id => params[:id])
    @schedulings.each do |scheduling|
      params[:schedule][:schedulings][scheduling.id].merge!(scheduling.id)
      scheduling.update_attributes(params[:schedule][:schedulings])
    end
    params[:schedule].delete(:schedulings)

    if @schedule.update_attributes(params[:schedule])
      flash[:notice] = "Successfully updated schedule."
      redirect_to @schedule #schedules_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    schedulings = Scheduling.find(:schedule_id => params[:id])
    @schedulings.each do |scheduling|
      scheduling.destroy
    end
    @schedule.destroy
    flash[:notice] = "Successfully destroyed schedule."
    redirect_to root_url
  end
end

