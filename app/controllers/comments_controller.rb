class CommentsController < ApplicationController
  filter_resource_access
  def new
  end

  def create
  	#@schedule = Schedule.find(params[:schedule_id])
    #@comment = @schedule.comments.build(params[:comment])

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
    #@schedule = Schedule.find(@comment.schedule_id)
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

  def index
  end

  def show
  end
end

