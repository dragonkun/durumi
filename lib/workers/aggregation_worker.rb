class AggregationWorker < BackgrounDRb::MetaWorker
  set_worker_name :aggregation_worker

  def create(args = nil)
    # this method is called, when worker is loaded for the first time
  end

  def fetch
    @feeds = Feed.find :all

    for feed in @feeds
      feed.fetch
    end
  end
end

