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
  end

  def new

  end

  def create
    debugger
    @schedule.user = current_user
#    params[:schedule][:collections_attributes].delete("new_collections")

#    params[:schedule][:collections_attributes].each_value {|value|
#      value[:schedulings_attributes].delete_if{ |key,val|
#        key.to_s. include?("new_")
#      }
#    }
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
    debugger
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

