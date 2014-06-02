require 'test_helper'

class ObersvationsControllerTest < ActionController::TestCase
  setup do
    @obersvation = obersvations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obersvations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obersvation" do
    assert_difference('Obersvation.count') do
      post :create, obersvation: {  }
    end

    assert_redirected_to obersvation_path(assigns(:obersvation))
  end

  test "should show obersvation" do
    get :show, id: @obersvation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obersvation
    assert_response :success
  end

  test "should update obersvation" do
    patch :update, id: @obersvation, obersvation: {  }
    assert_redirected_to obersvation_path(assigns(:obersvation))
  end

  test "should destroy obersvation" do
    assert_difference('Obersvation.count', -1) do
      delete :destroy, id: @obersvation
    end

    assert_redirected_to obersvations_path
  end
end
