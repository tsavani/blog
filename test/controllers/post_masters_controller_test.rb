require 'test_helper'

class PostMastersControllerTest < ActionController::TestCase
  setup do
    @post_master = post_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_master" do
    assert_difference('PostMaster.count') do
      post :create, post_master: { blog_master_id: @post_master.blog_master_id, discription: @post_master.discription, post_name: @post_master.post_name }
    end

    assert_redirected_to post_master_path(assigns(:post_master))
  end

  test "should show post_master" do
    get :show, id: @post_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_master
    assert_response :success
  end

  test "should update post_master" do
    patch :update, id: @post_master, post_master: { blog_master_id: @post_master.blog_master_id, discription: @post_master.discription, post_name: @post_master.post_name }
    assert_redirected_to post_master_path(assigns(:post_master))
  end

  test "should destroy post_master" do
    assert_difference('PostMaster.count', -1) do
      delete :destroy, id: @post_master
    end

    assert_redirected_to post_masters_path
  end
end
