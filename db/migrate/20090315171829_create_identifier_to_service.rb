class CreateIdentifierToService < ActiveRecord::Migration
  def self.up
		add_column :durumi_services, :identifier, :string
  end

  def self.down
		remove_column :durumi_services, :identifier
  end
end
