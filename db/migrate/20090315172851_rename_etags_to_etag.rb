class RenameEtagsToEtag < ActiveRecord::Migration
  def self.up
		rename_column :durumi_feeds, :etags, :etag
  end

  def self.down
		rename_column :durumi_feeds, :etag, :etags
  end
end
