require 'test_helper'

class ScrapeControllerTest < ActionDispatch::IntegrationTest
  test "test route runs successfully" do
    get scrape_url
    assert_response :success
  end
end
