class Admin::ItemsController < AdminController
  # GET /items
  # GET /items.xml
  def index
		@items = Item.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 15

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end
end
