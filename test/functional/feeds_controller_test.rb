require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed" do
    assert_difference('Feed.count') do
      post :create, :feed => { }
    end

    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should show feed" do
    get :show, :id => durumi_feeds(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => durumi_feeds(:one).id
    assert_response :success
  end

  test "should update feed" do
    put :update, :id => durumi_feeds(:one).id, :feed => { }
    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should destroy feed" do
    assert_difference('Feed.count', -1) do
      delete :destroy, :id => durumi_feeds(:one).id
    end

    assert_redirected_to feeds_path
  end
end
