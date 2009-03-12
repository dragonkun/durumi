require 'test_helper'

class FeedsettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedsettings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedsetting" do
    assert_difference('Feedsetting.count') do
      post :create, :feedsetting => { }
    end

    assert_redirected_to feedsetting_path(assigns(:feedsetting))
  end

  test "should show feedsetting" do
    get :show, :id => feedsettings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => feedsettings(:one).id
    assert_response :success
  end

  test "should update feedsetting" do
    put :update, :id => feedsettings(:one).id, :feedsetting => { }
    assert_redirected_to feedsetting_path(assigns(:feedsetting))
  end

  test "should destroy feedsetting" do
    assert_difference('Feedsetting.count', -1) do
      delete :destroy, :id => feedsettings(:one).id
    end

    assert_redirected_to feedsettings_path
  end
end
