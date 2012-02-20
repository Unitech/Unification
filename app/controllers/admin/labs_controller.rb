class Admin::LabsController < Admin::ResourcesController
  def create
    # Note that we still can still assign the item to another model. To change
    # this behavior we need only to change how we merge the params.
    item_params = params[:resource] || {}
    item_params.merge!(params[@object_name])

    @item = @resource.new
    @item.assign_attributes(item_params, :as => current_role, :without_protection => true)

    set_attributes_on_create

    respond_to do |format|
      if @item.save
        format.html { redirect_on_success }
        format.json { render :json => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def update
    attributes = params[:_nullify] ? { params[:_nullify] => nil } : params[@object_name]

    respond_to do |format|
      if @item.update_attributes(attributes, :as => current_role, :without_protection => true)
        set_attributes_on_update
        format.html { redirect_on_success }
        format.json { render :json => @item }
      else
        format.html { render :edit }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  
end
