require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @subreddit = Subreddit.create(title: 'Subreddit title')
    @post = Post.create(title: 'Post title', body: 'Post body', subreddit: @subreddit)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post subreddit_posts_url @subreddit, params: { post: { title: 'created', body: 'created', subreddit_id: @subreddit } }
    end

    # take user to 'index' of subreddits after creating one
    assert_redirected_to subreddit_path @subreddit
  end

  test "should get new" do
    get new_subreddit_post_url @subreddit
    assert_response :success
  end

  test 'should get edit' do
    get edit_subreddit_post_url(@subreddit, @post)
  end


  test 'should update subreddit' do
    patch subreddit_post_url(@subreddit, @post), params: { post: { title: 'updated', body: 'updated' } }

    # take user to 'show' subreddit after editing one
    assert_redirected_to subreddit_path(@subreddit)

    # Reload data to fetch updated data and assert that title is updated.
    @post.reload

    assert_equal 'updated', @post.title
    assert_equal 'updated', @post.body
  end
end
