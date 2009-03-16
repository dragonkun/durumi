class Admin::ProfileController < AdminController
  # GET /admin/profile
  # GET /admin/profile.xml
  def index
		@profile = current_user

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @profile }
    end
  end

end
