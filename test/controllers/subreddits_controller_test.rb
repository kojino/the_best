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

  test "should create subreddit" do
    assert_difference('Subreddit.count') do
      post subreddits_url, params: { subreddit: { title: 'created' } }
    end

    # take user to 'index' of subreddits after creating one
    assert_redirected_to subreddits_path
  end

  test "should get new" do
    get new_subreddit_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_subreddit_url(@subreddit)
  end

  test 'should get show' do
    get subreddit_url(@subreddit)
    assert_response :success
  end

  test 'should update subreddit' do
    patch subreddit_url(@subreddit), params: { subreddit: { title: 'updated' } }

    # take user to 'show' subreddit after editing one
    assert_redirected_to subreddit_path(@subreddit)

    # Reload data to fetch updated data and assert that title is updated.
    @subreddit.reload

    assert_equal 'updated', @subreddit.title
  end
end
