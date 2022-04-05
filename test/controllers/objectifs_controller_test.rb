require "test_helper"

class ObjectifsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get objectifs_index_url
    assert_response :success
  end

  test "should get create" do
    get objectifs_create_url
    assert_response :success
  end

  test "should get edit" do
    get objectifs_edit_url
    assert_response :success
  end
end
