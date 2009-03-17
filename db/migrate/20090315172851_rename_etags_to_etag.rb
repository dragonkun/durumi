class RenameEtagsToEtag < ActiveRecord::Migration
  def self.up
		rename_column :feeds, :etags, :etag
  end

  def self.down
		rename_column :feeds, :etag, :etags
  end
end
