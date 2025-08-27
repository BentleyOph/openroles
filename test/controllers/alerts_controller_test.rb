require "test_helper"

class AlertsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get alerts_create_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get alerts_unsubscribe_url
    assert_response :success
  end
end
