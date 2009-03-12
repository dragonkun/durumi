class CreateFeedsettings < ActiveRecord::Migration
  def self.up
    create_table :feedsettings do |t|
      t.integer :user_id
      t.integer :service_id
      t.string :parameter

      t.timestamps
    end
  end

  def self.down
    drop_table :feedsettings
  end
end
