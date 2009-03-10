class Admin::DashboardController < AdminController
  # GET /admin/dashboard
  # GET /admin/dashboard.xml
  def index
    @latest_items = Item.find(:all, :order => 'created_at DESC', :limit => 10)
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @feeds }
    end
  end

end
