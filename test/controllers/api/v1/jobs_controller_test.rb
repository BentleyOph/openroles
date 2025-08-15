require "test_helper"

class Api::V1::JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_jobs_index_url
    assert_response :success
  end
end
