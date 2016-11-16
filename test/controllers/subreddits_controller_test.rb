require 'test_helper'

class SubredditsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @subreddit = Subreddit.create(title: 'Subreddit title')
  end

  test "the truth" do
    assert true
  end

  test "should get index" do
    get subreddits_url
    assert_response :success
  end

  test "should get new" do
    get new_subreddit_url
    assert_response :success
  end

  # test 'shoudl redirect to index'

  test 'should get show' do
    get subreddit_path(@subreddit)
  end

  test 'should get edit' do
    get edit_subreddit_url(@subreddit)
  end

  test "should create subreddit" do
    assert_difference('Subreddit.count') do
      post subreddits_url, params: { subreddit: { title: "test" } }
    end

    assert_redirected_to subreddits_path
  end

  test "should create subreddit" do
    assert_difference('Subreddit.count') do
      post subreddits_url, params: { subreddit: { title: "test" } }
    end

    assert_redirected_to subreddits_path
  end
end
