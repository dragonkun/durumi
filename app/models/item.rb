class Item < ActiveRecord::Base
	set_table_name 'durumi_items'

	belongs_to :feed
end
