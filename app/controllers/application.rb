# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	include AuthenticatedSystem

	before_filter :has_admin_user
  helper :all # include all helpers, all the time
	layout 'default'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '679950698ac64adefddf3ea74c8203da'

  protected
  def has_admin_user
		redirect_to signup_url if User.count == 0
	end
		
end
