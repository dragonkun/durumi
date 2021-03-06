require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, :item => { }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, :id => durumi_items(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => durumi_items(:one).id
    assert_response :success
  end

  test "should update item" do
    put :update, :id => durumi_items(:one).id, :item => { }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, :id => durumi_items(:one).id
    end

    assert_redirected_to items_path
  end
end
