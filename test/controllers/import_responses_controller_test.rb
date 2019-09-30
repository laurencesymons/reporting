require 'test_helper'

class ImportResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get import_responses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get import_responses_destroy_url
    assert_response :success
  end

end
