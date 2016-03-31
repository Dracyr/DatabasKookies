require 'test_helper'

class ProductionBlocksControllerTest < ActionController::TestCase
  setup do
    @production_block = production_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_block" do
    assert_difference('ProductionBlock.count') do
      post :create, production_block: { end_at: @production_block.end_at, product_id: @production_block.product_id, start_at: @production_block.start_at }
    end

    assert_redirected_to production_block_path(assigns(:production_block))
  end

  test "should show production_block" do
    get :show, id: @production_block
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_block
    assert_response :success
  end

  test "should update production_block" do
    patch :update, id: @production_block, production_block: { end_at: @production_block.end_at, product_id: @production_block.product_id, start_at: @production_block.start_at }
    assert_redirected_to production_block_path(assigns(:production_block))
  end

  test "should destroy production_block" do
    assert_difference('ProductionBlock.count', -1) do
      delete :destroy, id: @production_block
    end

    assert_redirected_to production_blocks_path
  end
end
