require "test_helper"

class BillingsControllerTest < ActionDispatch::IntegrationTest
  test "should get run_today" do
    get billings_run_today_url
    assert_response :success
  end
end
