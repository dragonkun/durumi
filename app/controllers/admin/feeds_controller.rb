class Admin::FeedsController < AdminController
  # GET /feeds
  # GET /feeds.xml
  def index
    @feeds = Feed.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feeds }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.xml
  def new
    @feed = Feed.new
		@services = Service.find :all

		respond_to do |format|
			if params[:service_identifier]
				format.html { render :partial => params[:service_identifier], :layout => 'admin' }
				format.xml  { render :xml => @feed }
			else
				format.html # new.html.erb
				format.xml  { render :xml => @feed }
				
			end
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.xml
  def create
    @site_parameter = params[:site]
    @feed = Feed.new(params[:feed])
    @feed.set_site_feed(@site_parameter)
    @feed.user = current_user

    respond_to do |format|
      if @feed.save
        flash[:notice] = 'Feed was successfully created.'
        format.html { redirect_to(admin_feed_url(@feed)) }
        format.xml  { render :xml => @feed, :status => :created, :location => @feed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.xml
  def update
    @feed = Feed.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        flash[:notice] = 'Feed was successfully updated.'
        format.html { redirect_to(admin_feed_url(@feed)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.xml
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to(admin_feeds_url) }
      format.xml  { head :ok }
    end
  end

 	def fetch
    @feed = Feed.find(params[:id])
		@feed.fetch

    respond_to do |format|
      flash[:notice] = 'Feed was successfully fetched.'
      format.html { redirect_to(admin_settings_url) }
      format.xml  { head :ok }
    end
	end
end
