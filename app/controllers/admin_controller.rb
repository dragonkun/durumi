class AdminController < ApplicationController
  layout 'admin'

  before_filter :login_required
  #before_filter :admin_role_check

end
