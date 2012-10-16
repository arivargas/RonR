require 'test_helper'

class ContentsControllerTest < ActionController::TestCase
  setup do
    @content = contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content" do
    assert_difference('Content.count') do
      post :create, content: { author: @content.author, edition: @content.edition, journal_num: @content.journal_num, pages: @content.pages, pub_date: @content.pub_date, pub_house: @content.pub_house, pub_place: @content.pub_place, ref_date: @content.ref_date, title1: @content.title1, title2: @content.title2, volume: @content.volume, website: @content.website }
    end

    assert_redirected_to content_path(assigns(:content))
  end

  test "should show content" do
    get :show, id: @content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content
    assert_response :success
  end

  test "should update content" do
    put :update, id: @content, content: { author: @content.author, edition: @content.edition, journal_num: @content.journal_num, pages: @content.pages, pub_date: @content.pub_date, pub_house: @content.pub_house, pub_place: @content.pub_place, ref_date: @content.ref_date, title1: @content.title1, title2: @content.title2, volume: @content.volume, website: @content.website }
    assert_redirected_to content_path(assigns(:content))
  end

  test "should destroy content" do
    assert_difference('Content.count', -1) do
      delete :destroy, id: @content
    end

    assert_redirected_to contents_path
  end
end
