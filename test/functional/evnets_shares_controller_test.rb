require 'test_helper'

class EvnetsSharesControllerTest < ActionController::TestCase
  setup do
    @evnets_share = evnets_shares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evnets_shares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evnets_share" do
    assert_difference('EvnetsShare.count') do
      post :create, evnets_share: { share: @evnets_share.share }
    end

    assert_redirected_to evnets_share_path(assigns(:evnets_share))
  end

  test "should show evnets_share" do
    get :show, id: @evnets_share
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evnets_share
    assert_response :success
  end

  test "should update evnets_share" do
    put :update, id: @evnets_share, evnets_share: { share: @evnets_share.share }
    assert_redirected_to evnets_share_path(assigns(:evnets_share))
  end

  test "should destroy evnets_share" do
    assert_difference('EvnetsShare.count', -1) do
      delete :destroy, id: @evnets_share
    end

    assert_redirected_to evnets_shares_path
  end
end
