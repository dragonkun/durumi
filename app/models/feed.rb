class Feed < ActiveRecord::Base
	set_table_name :durumi_feeds

	has_many :items
	belongs_to :service
end
