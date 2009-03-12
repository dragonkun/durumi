class Services::TwitterController < ServicesController
  
  def index
    @feedsetting = Feedsetting.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @feedsetting }
    end
  end

  def create
    @feedsetting = Feedsetting.new(params[:feedsetting])
    respond_to do |format|
      if @feedsetting.save
        flash[:notice] = 'Feedsetting was successfully created.'
        format.html { redirect_to(@feedsetting) }
        format.xml  { render :xml => @feedsetting, :status => :created, :location => @item }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @feedsetting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
