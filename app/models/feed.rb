require 'open-uri'
require 'net/http'
require 'uri'
require 'rfeedparser'
require 'iconv'
require 'cgi'

class Feed < ActiveRecord::Base
	set_table_name 'durumi_feeds'

	has_many :items, :dependent => :destroy
	belongs_to :service

	def fetch
		header = {}

		# if self.lastmod
		# 	header["If-Modified-Match"] = self.lastmod
		#	end
		# if self.etag
		#		header["If-None-Match"] = self.etag
		#	end

		unless header.empty?
			begin
				open(self.url, header) do |f|
					self.etag = f.meta['etag']
					self.lastmod =  f.last_modified
				end
			rescue OpenURI::HTTPError
				# TODO: Maybe Not Modified...
			end
		end
		
		begin 
			#feed = FeedParser.parse(self.url, { :etag => self.etag, :modified => self.modified_at })
			feed = FeedParser.parse(self.url)
		end

		# self.etag = feed.result['etag']
		# self.modified_at = feed.result['modified']
		# self.save

		feed.entries.each do |entry|
      if Item.find_by_link(entry.link) == nil
        new_item = Item.new
        new_item.feed_id = 1 ## FIXME: Hard coding for test
        new_item.title = entry.title
        new_item.link = CGI::unescape(entry.link)
        new_item.body = entry.content[0].value.gsub(/<\/?[^>]*>/, "") if entry.content
        new_item.save
      end
		end
	end
end
