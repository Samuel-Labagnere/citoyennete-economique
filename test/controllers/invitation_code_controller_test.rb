require "test_helper"

class InvitationCodeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invitation_code_index_url
    assert_response :success
  end
end
