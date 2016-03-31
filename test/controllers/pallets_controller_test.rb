require 'test_helper'

class PalletsControllerTest < ActionController::TestCase
  setup do
    @pallet = pallets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pallets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pallet" do
    assert_difference('Pallet.count') do
      post :create, pallet: { order_id: @pallet.order_id, product_id: @pallet.product_id, status: @pallet.status }
    end

    assert_redirected_to pallet_path(assigns(:pallet))
  end

  test "should show pallet" do
    get :show, id: @pallet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pallet
    assert_response :success
  end

  test "should update pallet" do
    patch :update, id: @pallet, pallet: { order_id: @pallet.order_id, product_id: @pallet.product_id, status: @pallet.status }
    assert_redirected_to pallet_path(assigns(:pallet))
  end

  test "should destroy pallet" do
    assert_difference('Pallet.count', -1) do
      delete :destroy, id: @pallet
    end

    assert_redirected_to pallets_path
  end
end
