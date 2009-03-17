class CreateIdentifierToService < ActiveRecord::Migration
  def self.up
		add_column :services, :identifier, :string

		Service.create(:name => '블로그', :identifier => 'blog' )
		Service.create(:name => 'Delicious', :identifier => 'delicious')
		Service.create(:name => 'flickr', :identifier => 'flickr')
		Service.create(:name => 'friendfeed', :identifier => 'friendfeed')
		Service.create(:name => '구글 리더', :identifier => 'googlereader')
		Service.create(:name => 'Last.fm 선호하는 곡', :identifier => 'lastfm_lovedsong')
		Service.create(:name => 'Last.fm 최근 들은 곡', :identifier => 'lastfm_recentlisten')
		Service.create(:name => '레몬펜', :identifier => 'lemonpen')
		Service.create(:name => '미투데이', :identifier => 'me2day')
		Service.create(:name => '롤링리스트', :identifier => 'rollinglist')
		Service.create(:name => '스프링노트', :identifier => 'springnote')
		Service.create(:name => 'Twitter', :identifier => 'twitter')
		Service.create(:name => 'YouTube', :identifier => 'youtube')
		Service.create(:name => '기타 RSS/ATOM 피드', :identifier => 'customfeed')
  end

  def self.down
		remove_column :services, :identifier
  end
end
