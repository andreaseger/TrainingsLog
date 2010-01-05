class UsersController < ApplicationController
  filter_access_to :index, :show, :edit, :update
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    #set default role to registered_user
    @user.group_ids = ['2']
    @user.save do |result|
      if result
        flash[:notice] = "Registration successful."
        redirect_to root_url
      else
        render :action => 'new'
      end
    end
  end

  def update
    if params[:id] == "current"
	    @user =  current_user
    else
	    @user = User.find(params[:id])
    end
    @user.attributes = params[:user]
    @user.save do |result|
      if result
        flash[:notice] = "Successfully updated profile."
        redirect_to root_url
      else
        render :action => 'edit'
      end
    end
  end

	def edit
	  if params[:id] == "current"
	    @user =  current_user
    else
	    @user = User.find(params[:id])
    end
	end

  def index
    @users = User.all
  end
end

