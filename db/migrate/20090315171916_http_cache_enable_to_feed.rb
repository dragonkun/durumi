class HttpCacheEnableToFeed < ActiveRecord::Migration
  def self.up
		add_column :feeds, :etags, :string
		add_column :feeds, :lastmod, :string
  end

  def self.down
		remove_column :feeds, :etags
		remove_column :feeds, :lastmod
  end
end
