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

end
