class HttpCacheEnableToFeed < ActiveRecord::Migration
  def self.up
		add_column :durumi_feeds, :etags, :string
		add_column :durumi_feeds, :lastmod, :string
  end

  def self.down
		remove_column :durumi_feeds, :etags
		remove_column :durumi_feeds, :lastmod
  end
end
