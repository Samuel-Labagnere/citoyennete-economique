require "test_helper"

class MentionsLegalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mentions_legales_index_url
    assert_response :success
  end
end
