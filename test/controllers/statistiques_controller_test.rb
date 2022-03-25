require "test_helper"

class StatistiquesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistiques_index_url
    assert_response :success
  end
end
