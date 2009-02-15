class Service < ActiveRecord::Base
	set_table_name :durumi_services

	has_many :feeds
end
