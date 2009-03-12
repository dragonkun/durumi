class FeedsettingsController < ApplicationController
  # GET /feedsettings
  # GET /feedsettings.xml
  def index
    @feedsettings = Feedsetting.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feedsettings }
    end
  end

  # GET /feedsettings/1
  # GET /feedsettings/1.xml
  def show
    @feedsetting = Feedsetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feedsetting }
    end
  end

  # GET /feedsettings/new
  # GET /feedsettings/new.xml
  def new
    @feedsetting = Feedsetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feedsetting }
    end
  end

  # GET /feedsettings/1/edit
  def edit
    @feedsetting = Feedsetting.find(params[:id])
  end

  # POST /feedsettings
  # POST /feedsettings.xml
  def create
    @feedsetting = Feedsetting.new(params[:feedsetting])

    respond_to do |format|
      if @feedsetting.save
        flash[:notice] = 'Feedsetting was successfully created.'
        format.html { redirect_to(@feedsetting) }
        format.xml  { render :xml => @feedsetting, :status => :created, :location => @feedsetting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feedsetting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feedsettings/1
  # PUT /feedsettings/1.xml
  def update
    @feedsetting = Feedsetting.find(params[:id])

    respond_to do |format|
      if @feedsetting.update_attributes(params[:feedsetting])
        flash[:notice] = 'Feedsetting was successfully updated.'
        format.html { redirect_to(@feedsetting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feedsetting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feedsettings/1
  # DELETE /feedsettings/1.xml
  def destroy
    @feedsetting = Feedsetting.find(params[:id])
    @feedsetting.destroy

    respond_to do |format|
      format.html { redirect_to(feedsettings_url) }
      format.xml  { head :ok }
    end
  end
end
