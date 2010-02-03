class ItemsController < ApplicationController
  filter_resource_access

  def index
    respond_to do |format|
      format.html{
        if params[:search] != nil
          @items = Item.search(params[:search],params[:page])
        else
          @items = Item.paginate(:page => params[:page], :per_page => 20, :order => 'description')
        end
      }
      format.js {
        @items = Item.find(:all, :conditions => ["description LIKE ?", '%'+params[:q] + '%' ], :limit => 20, :order => 'distance, stroke_id')
        render :text => @items.map{ |c| "#{c.display_name}|#{c.id}\n" }
      }
    end
  end

  def new
  end

  def create
    @stroke = Stroke.find(@item.stroke_id)
    if @item.tool_id == nil
      @item.description = @item.distance.to_s + 'm ' + @stroke.name
    else
      @tool = Tool.find(@item.tool_id)
      @item.description = @item.distance.to_s + 'm ' + @stroke.name + ', ' + @tool.name
    end

    if @item.save
      flash[:notice] = "Successfully created items."
      redirect_to items_url
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update

    custom = params[:item]
    @stroke = Stroke.find(custom[:stroke_id])
    description = 'foo'
    if custom[:tool_id] == nil
      description = custom[:distance] + 'm ' + @stroke.name
    else
      @tool = Tool.find(custom[:tool_id])
      description = custom[:distance] + 'm ' + @stroke.name + ', ' + @tool.name
    end
    params[:item].merge!(:description => description)


    if @item.update_attributes(params[:item])
      flash[:notice] = "Successfully updated items."
      redirect_to items_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Successfully destroyed items."
    redirect_to items_url
  end
end

