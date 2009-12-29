class CommentsController < ApplicationController
  def create
  	@schedule = Schedule.find(params[:schedule_id])
    @comment = @schedule.comments.create!(params[:comment])
    respond_to do |format|
    	format.html { redirect_to @schedule }
    	format.js
  	end
  end
end
