require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(username: 'Professor Braus')
    @subreddit = Subreddit.create(title: 'Subreddit title', user: @user)
    @post = Post.create(title: 'Post title', body: 'Post body', subreddit: @subreddit, user: @user)
    @comment1 = Comment.create(content: 'Comment content1', post: @post, user: @user)
    @comment2 = Comment.create(content: 'Comment content2', post: @post, user: @user)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post subreddit_posts_url @subreddit, params: { post: { title: 'created', body: 'created', subreddit: @subreddit } }
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


  test 'should update post' do
    patch subreddit_post_url(@subreddit, @post), params: { post: { title: 'updated', body: 'updated' } }

    # take user to 'show' subreddit after editing one
    assert_redirected_to subreddit_path(@subreddit)

    # Reload data to fetch updated data and assert that title is updated.
    @post.reload

    assert_equal 'updated', @post.title
    assert_equal 'updated', @post.body
  end

  test 'should delete post' do
    assert_difference('Post.count', -1) do
      assert_difference('Comment.count', -2) do
        delete subreddit_post_url(@subreddit, @post)
      end
    end
  end
end
