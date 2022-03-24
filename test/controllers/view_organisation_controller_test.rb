require "test_helper"

class ViewOrganisationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get view_organisation_index_url
    assert_response :success
  end
end
