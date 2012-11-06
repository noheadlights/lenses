require 'test_helper'

class LensesControllerTest < ActionController::TestCase
  setup do
    @lense = lenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lense" do
    assert_difference('Lense.count') do
      post :create, lense: { brand_id: @lense.brand_id, lense_type_id: @lense.lense_type_id, max_aperture: @lense.max_aperture, max_focal_length: @lense.max_focal_length, min_aperture: @lense.min_aperture, min_focal_length: @lense.min_focal_length, name: @lense.name, notes: @lense.notes }
    end

    assert_redirected_to lense_path(assigns(:lense))
  end

  test "should show lense" do
    get :show, id: @lense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lense
    assert_response :success
  end

  test "should update lense" do
    put :update, id: @lense, lense: { brand_id: @lense.brand_id, lense_type_id: @lense.lense_type_id, max_aperture: @lense.max_aperture, max_focal_length: @lense.max_focal_length, min_aperture: @lense.min_aperture, min_focal_length: @lense.min_focal_length, name: @lense.name, notes: @lense.notes }
    assert_redirected_to lense_path(assigns(:lense))
  end

  test "should destroy lense" do
    assert_difference('Lense.count', -1) do
      delete :destroy, id: @lense
    end

    assert_redirected_to lenses_path
  end
end
