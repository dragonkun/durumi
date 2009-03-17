class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :feed_id
      t.string :title
      t.string :link
      t.string :guid
      t.string :author
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
