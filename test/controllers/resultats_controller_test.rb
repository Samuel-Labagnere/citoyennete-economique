require "test_helper"

class ResultatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resultats_index_url
    assert_response :success
  end
end
