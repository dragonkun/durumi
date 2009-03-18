class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    items_all = Item.find(:all, :order => 'created_at desc')
    @services = Service.find :all
		@feeds = Feed.find :all
    @items = []

    target = []
    if cookies["filter_type"] && cookies["filter_type"] == "service"
      for service in @services
        target << service if cookies[service.identifier] == 'on'
      end

      items_all.each do |i|
        @items << i if target.include?(i.feed.service)
      end
      @items = @items.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 15
    elsif cookies["filter_type"] && cookies["filter_type"] == "feed"
      for feed in @feeds
        target << feed if cookies[feed.id] == 'on'
      end

      items_all.each do |i|
        @items << i if target.include?(i.feed)
      end
      @items = @items.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 15
    else
      @items = items_all.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 15
    end

    respond_to do |format|
      format.html # index.html.erb
			format.rss { render :layout => false }
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
