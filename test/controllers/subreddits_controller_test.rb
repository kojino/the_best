require 'test_helper'

class SubredditsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'Professor Braus')
    @subreddit = Subreddit.create(title: 'Subreddit title', user: @user)
    @post = Post.create(title: 'Post title', body: 'Post body', subreddit: @subreddit, user: @user)
    @comment1 = Comment.create(content: 'Comment content1', post: @post, user: @user)
    @comment2 = Comment.create(content: 'Comment content2', post: @post, user: @user)
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

  test 'should delete subreddit' do
    assert_difference('Subreddit.count', -1) do
      assert_difference('Post.count', -2) do
        assert_difference('Comment.count', -2) do
          delete subreddit_url(@subreddit)
        end
      end
    end
  end
end
