require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post :create, :service => { }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test "should show service" do
    get :show, :id => durumi_services(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => durumi_services(:one).id
    assert_response :success
  end

  test "should update service" do
    put :update, :id => durumi_services(:one).id, :service => { }
    assert_redirected_to service_path(assigns(:service))
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, :id => durumi_services(:one).id
    end

    assert_redirected_to services_path
  end
end
