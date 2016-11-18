require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.create(username: 'Professor Braus')
    @subreddit = Subreddit.create(title: 'Subreddit title', user: @user)
    @post = Post.create(title: 'Post title', body: 'Post body', subreddit: @subreddit, user: @user)
    @comment = Comment.create(content: 'Comment content', post: @post, user: @user)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url @post, params: { comment: { content: 'created', post: @post, user: @user } }
    end

    # take user to 'index' of subreddits after creating one
    assert_redirected_to post_path @post
  end

  test "should get new" do
    get new_post_comment_url @post
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_comment_url(@post, @comment)
  end


  test 'should update comment' do
    patch post_comment_url(@post, @comment), params: { comment: { content: 'updated' } }

    # take user to 'show' subreddit after editing one
    assert_redirected_to post_path(@post)

    # Reload data to fetch updated data and assert that title is updated.
    @comment.reload

    assert_equal 'updated', @comment.content
  end

  test 'should delete comment' do
    assert_difference('Comment.count', -1) do
      delete post_comment_url(@post, @comment)
    end
  end
end
