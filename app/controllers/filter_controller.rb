class FilterController < ApplicationController
  def index
    if params[:service_filter]
      cookies['filter_type'] = 'service'
      for service in Service.find :all
        cookies[service.identifier] = 'off'
      end
      for filter in params[:service_filter]
        cookies[filter[0]] = filter[1]
      end
    else
      cookies['filter_type'] = 'feed'
      for feed in Feed.find :all
        cookies[feed.id] = 'off'
      end
      for filter in params[:feed_filter]
        cookies[filter[0]] = filter[1]
      end
    end

    redirect_to :back
  end
end
