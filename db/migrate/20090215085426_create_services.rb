class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :durumi_services do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :durumi_services
  end
end
