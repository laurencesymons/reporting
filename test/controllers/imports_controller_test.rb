require 'test_helper'

class ImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get imports_create_url
    assert_response :success
  end

  test "should get show" do
    get imports_show_url
    assert_response :success
  end

  test "should get index" do
    get imports_index_url
    assert_response :success
  end

  test "should get destroy" do
    get imports_destroy_url
    assert_response :success
  end

end
