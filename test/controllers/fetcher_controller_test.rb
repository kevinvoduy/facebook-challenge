require 'test_helper'

class FetcherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fetcher_index_url
    assert_response :success
  end

end
