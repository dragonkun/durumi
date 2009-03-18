require 'open-uri'
require 'net/http'
require 'uri'
require 'rfeedparser'
require 'iconv'
require 'cgi'

class Feed < ActiveRecord::Base
	has_many :items, :dependent => :destroy
	belongs_to :service
  belongs_to :user

  validates_uniqueness_of :url

	def fetch
		header = {}

#		if self.lastmod
#		 	header["If-Modified-Match"] = self.lastmod
#		end
		if self.etag
				header["If-None-Match"] = self.etag
		end

		unless header.empty?
			begin
				open(self.url, header) do |f|
					self.etag = f.meta['etag']
					self.lastmod =  f.modified_time
				end
			rescue OpenURI::HTTPError
				# TODO: Maybe Not Modified...
			end
		end
		
		begin 
			feed = FeedParser.parse(self.url, { :etag => self.etag, :modified => self.lastmod })
		end

		self.etag = feed.etag
		self.lastmod = feed.modified
    self.title = feed.feed.title
    self.image = feed.feed.image
		self.save

		feed.entries.each do |entry|
      if Item.find_by_link(entry.link) == nil && Item.find_by_guid(entry.guid) == nil
        new_item = Item.new
        new_item.feed_id = self.id
        new_item.title = entry.title
        new_item.link = CGI::unescape(entry.link)
        new_item.guid = CGI::unescape(entry.guid)
        new_item.body = entry.content[0].value.gsub(/<\/?[^>]*>/, "") if entry.content
        new_item.created_at = entry.updated_time
        new_item.save
      end
		end
	end

  def set_site_feed(site)
    self.url = case self.service.identifier
      when "blog":
        ""
      when "customfeed":
        ""
      when "delicious":
        "http://feeds.delicious.com/v2/rss/#{site[:parameter]}"
      when "flickr":
        ""
      when "friendfeed":
        ""
      when "googlereader":
        ""
      when "lastfm_lovedsong":
        ""
      when "lastfm_recentlisten":
        "http://ws.audioscrobbler.com/1.0/user/#{site[:parameter]}/recenttracks.rss"
      when "lemonpen":
        ""
      when "me2day":
        "http://me2day.net/#{site[:parameter]}/rss"
      when "rollinglist":
        ""
      when "springnote":
        ""
      when "twitter":
        ""
      when "youtube":
        ""
    end
  end
end
