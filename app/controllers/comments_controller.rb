class CommentsController < ApplicationController
  filter_resource_access
  def new
  end

  def create
    @comment.user = current_user
    @comment.save
    
    respond_to do |format|
    	format.html { redirect_to schedule_url(@comment.schedule_id) }
    	format.js
  	end
  end

  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to schedule_url(@comment.schedule_id)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @schedule = Schedule.find(@comment.schedule_id)
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to @schedule
  end
end

