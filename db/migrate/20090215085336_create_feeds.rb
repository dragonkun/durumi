class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :durumi_feeds do |t|
      t.integer :user_id
      t.integer :service_id
      t.string :title
      t.string :url
      t.string :image
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :durumi_feeds
  end
end
