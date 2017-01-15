require 'test_helper'

class ForumCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get forum_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get forum_comments_destroy_url
    assert_response :success
  end

end
