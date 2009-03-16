class CreateIdentifierToService < ActiveRecord::Migration
  def self.up
		add_column :services, :identifier, :string
  end

  def self.down
		remove_column :services, :identifier
  end
end
