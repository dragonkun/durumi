class FrontpageController < ApplicationController

	def index
		redirect_to items_url
	end

end
