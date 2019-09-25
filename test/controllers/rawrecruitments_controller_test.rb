require 'test_helper'

class RawrecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rawrecruitments_create_url
    assert_response :success
  end

end
