require 'test_helper'

class BaseApiControllerTest < ActionDispatch::IntegrationTest
  test "should get skip-template-engine" do
    get base_api_skip-template-engine_url
    assert_response :success
  end

end
