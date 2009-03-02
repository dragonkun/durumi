require 'test_helper'

class FeedTest < ActiveSupport::TestCase
	set_fixture_class :durumi_feeds => Feed
  fixtures :durumi_feeds

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

	def test_feed_one
		durumi_feeds(:one).update_attributes(:title => 'title')
		assert_not_nil durumi_feeds(:one) 
	end

end
