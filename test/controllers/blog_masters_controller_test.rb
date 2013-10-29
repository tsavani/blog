require 'test_helper'

class BlogMastersControllerTest < ActionController::TestCase
  setup do
    @blog_master = blog_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_master" do
    assert_difference('BlogMaster.count') do
      post :create, blog_master: { blog_name: @blog_master.blog_name, discription: @blog_master.discription, user_id: @blog_master.user_id }
    end

    assert_redirected_to blog_master_path(assigns(:blog_master))
  end

  test "should show blog_master" do
    get :show, id: @blog_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_master
    assert_response :success
  end

  test "should update blog_master" do
    patch :update, id: @blog_master, blog_master: { blog_name: @blog_master.blog_name, discription: @blog_master.discription, user_id: @blog_master.user_id }
    assert_redirected_to blog_master_path(assigns(:blog_master))
  end

  test "should destroy blog_master" do
    assert_difference('BlogMaster.count', -1) do
      delete :destroy, id: @blog_master
    end

    assert_redirected_to blog_masters_path
  end
end
