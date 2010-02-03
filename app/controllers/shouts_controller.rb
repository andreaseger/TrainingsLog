class ShoutsController < ApplicationController
  filter_resource_access
  def new
  end
  
  def create
    @shout.user = current_user
    @shout.save
    
    respond_to do |format|
      format.html { redirect_to schedule_url(@shout.schedule_id) }
      format.js
  	end
  end
  
  def destroy
    @schedule = Schedule.find(@shout.schedule_id)
    @shout.destroy
    flash[:notice] = "Successfully destroyed shout."
    redirect_to @schedule
  end
end
