require 'test_helper'

class ConfigControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get config_show_url
    assert_response :success
  end

  test "should get download" do
    get config_download_url
    assert_response :success
  end

  test "should get upload" do
    get config_upload_url
    assert_response :success
  end

  test "should get reload" do
    get config_reload_url
    assert_response :success
  end

end
